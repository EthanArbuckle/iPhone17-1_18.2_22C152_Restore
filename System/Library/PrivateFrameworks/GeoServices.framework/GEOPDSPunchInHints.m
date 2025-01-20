@interface GEOPDSPunchInHints
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSPunchInHints)init;
- (GEOPDSPunchInHints)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)queryHints;
- (uint64_t)hasGreenTeaWithValue:(uint64_t)result;
- (unint64_t)hash;
- (void)_addNoFlagsResultHints:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readQueryHints;
- (void)_readResultHints;
- (void)_readTappedResultHint;
- (void)addResultHints:(uint64_t)a1;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)mergeFrom:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setAppId:(uint64_t)a1;
- (void)setQueryHints:(uint64_t)a1;
- (void)setTappedResultHint:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSPunchInHints

- (GEOPDSPunchInHints)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSPunchInHints;
  v2 = [(GEOPDSPunchInHints *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSPunchInHints)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSPunchInHints;
  v3 = [(GEOPDSPunchInHints *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)setAppId:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 68) |= 2u;
    *(unsigned char *)(a1 + 68) |= 0x20u;
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (void)_readQueryHints
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSPunchInHintsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readQueryHints_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)queryHints
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDSPunchInHints _readQueryHints]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setQueryHints:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 68) |= 4u;
    *(unsigned char *)(a1 + 68) |= 0x20u;
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (void)_readResultHints
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSPunchInHintsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readResultHints_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (void)addResultHints:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDSPunchInHints _readResultHints](a1);
    -[GEOPDSPunchInHints _addNoFlagsResultHints:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 68) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(unsigned char *)(a1 + 68) |= 0x20u;
  }
}

- (void)_addNoFlagsResultHints:(uint64_t)a1
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

- (void)_readTappedResultHint
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSPunchInHintsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTappedResultHint_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (void)setTappedResultHint:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 68) |= 0x10u;
    *(unsigned char *)(a1 + 68) |= 0x20u;
    objc_storeStrong((id *)(a1 + 48), a2);
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSPunchInHints;
  id v4 = [(GEOPDSPunchInHints *)&v8 description];
  id v5 = [(GEOPDSPunchInHints *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSPunchInHints _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDSPunchInHints readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 2) == 0)
    {
      id v5 = *(void **)(a1 + 8);
      if (v5)
      {
        id v6 = v5;
        objc_sync_enter(v6);
        GEOPDSPunchInHintsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAppId_tags_0);
        objc_sync_exit(v6);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    id v7 = *(id *)(a1 + 24);
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"appId";
      }
      else {
        objc_super v8 = @"app_id";
      }
      [v4 setObject:v7 forKey:v8];
    }

    v9 = -[GEOPDSPunchInHints queryHints]((id *)a1);
    v10 = v9;
    if (v9)
    {
      if (a2)
      {
        v11 = [v9 jsonRepresentation];
        v12 = @"queryHints";
      }
      else
      {
        v11 = [v9 dictionaryRepresentation];
        v12 = @"query_hints";
      }
      [v4 setObject:v11 forKey:v12];
    }
    if ([*(id *)(a1 + 40) count])
    {
      v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v14 = *(id *)(a1 + 40);
      uint64_t v15 = [v14 countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v35 != v16) {
              objc_enumerationMutation(v14);
            }
            v18 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            if (a2) {
              [v18 jsonRepresentation];
            }
            else {
            v19 = [v18 dictionaryRepresentation];
            }
            [v13 addObject:v19];
          }
          uint64_t v15 = [v14 countByEnumeratingWithState:&v34 objects:v38 count:16];
        }
        while (v15);
      }

      if (a2) {
        v20 = @"resultHints";
      }
      else {
        v20 = @"result_hints";
      }
      [v4 setObject:v13 forKey:v20];
    }
    -[GEOPDSPunchInHints _readTappedResultHint](a1);
    id v21 = *(id *)(a1 + 48);
    v22 = v21;
    if (v21)
    {
      if (a2)
      {
        v23 = [v21 jsonRepresentation];
        v24 = @"tappedResultHint";
      }
      else
      {
        v23 = [v21 dictionaryRepresentation];
        v24 = @"tapped_result_hint";
      }
      [v4 setObject:v23 forKey:v24];
    }
    v25 = *(void **)(a1 + 16);
    if (v25)
    {
      v26 = [v25 dictionaryRepresentation];
      v27 = v26;
      if (a2)
      {
        v28 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v26, "count"));
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __48__GEOPDSPunchInHints__dictionaryRepresentation___block_invoke;
        v32[3] = &unk_1E53D8860;
        id v29 = v28;
        id v33 = v29;
        [v27 enumerateKeysAndObjectsUsingBlock:v32];
        id v30 = v29;
      }
      else
      {
        id v30 = v26;
      }
      [v4 setObject:v30 forKey:@"Unknown Fields"];
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
  return -[GEOPDSPunchInHints _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_333;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_334;
      }
      GEOPDSPunchInHintsReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDSPunchInHintsCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __48__GEOPDSPunchInHints__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        id v6 = @"appId";
      }
      else {
        id v6 = @"app_id";
      }
      id v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[v7 copy];
        -[GEOPDSPunchInHints setAppId:]((uint64_t)a1, v8);
      }
      if (a3) {
        v9 = @"queryHints";
      }
      else {
        v9 = @"query_hints";
      }
      id v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = [GEOPDSPunchInQueryHints alloc];
        if (v11)
        {
          id v12 = v10;
          v11 = [(GEOPDSPunchInQueryHints *)v11 init];
          if (v11)
          {
            if (a3) {
              v13 = @"originalSearchQuery";
            }
            else {
              v13 = @"original_search_query";
            }
            id v14 = [v12 objectForKeyedSubscript:v13];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v15 = (void *)[v14 copy];
              -[GEOPDSPunchInQueryHints setOriginalSearchQuery:]((uint64_t)v11, v15);
            }
            if (a3) {
              uint64_t v16 = @"completedSearchQuery";
            }
            else {
              uint64_t v16 = @"completed_search_query";
            }
            v17 = [v12 objectForKeyedSubscript:v16];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v18 = (void *)[v17 copy];
              -[GEOPDSPunchInQueryHints setCompletedSearchQuery:]((uint64_t)v11, v18);
            }
          }
        }
        -[GEOPDSPunchInHints setQueryHints:]((uint64_t)a1, v11);
      }
      if (a3) {
        v19 = @"resultHints";
      }
      else {
        v19 = @"result_hints";
      }
      v20 = [v5 objectForKeyedSubscript:v19];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v35 = v5;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        id v21 = v20;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v36 objects:v40 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v37;
          do
          {
            uint64_t v25 = 0;
            do
            {
              if (*(void *)v37 != v24) {
                objc_enumerationMutation(v21);
              }
              v26 = *(void **)(*((void *)&v36 + 1) + 8 * v25);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v27 = [GEOPDSPunchInResultHints alloc];
                if (v27) {
                  v28 = (void *)-[GEOPDSPunchInResultHints _initWithDictionary:isJSON:](v27, v26, a3);
                }
                else {
                  v28 = 0;
                }
                -[GEOPDSPunchInHints addResultHints:]((uint64_t)a1, v28);
              }
              ++v25;
            }
            while (v23 != v25);
            uint64_t v29 = [v21 countByEnumeratingWithState:&v36 objects:v40 count:16];
            uint64_t v23 = v29;
          }
          while (v29);
        }

        id v5 = v35;
      }

      if (a3) {
        id v30 = @"tappedResultHint";
      }
      else {
        id v30 = @"tapped_result_hint";
      }
      v31 = [v5 objectForKeyedSubscript:v30];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v32 = [GEOPDSPunchInResultHints alloc];
        if (v32) {
          id v33 = (void *)-[GEOPDSPunchInResultHints _initWithDictionary:isJSON:](v32, v31, a3);
        }
        else {
          id v33 = 0;
        }
        -[GEOPDSPunchInHints setTappedResultHint:]((uint64_t)a1, v33);
      }
    }
  }

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSPunchInHintsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDSPunchInHintsIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOPDSPunchInHints readAll:]((uint64_t)self, 0);
    if (self->_appId) {
      PBDataWriterWriteStringField();
    }
    if (self->_queryHints) {
      PBDataWriterWriteSubmessage();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = self->_resultHints;
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

    if (self->_tappedResultHint) {
      PBDataWriterWriteSubmessage();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
  }
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    -[GEOPDSPunchInHints _readResultHints](result);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = *(id *)(v3 + 40);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      while (2)
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * v8);
          if (v9)
          {
            -[GEOPDSPunchInResultHints _readCenter](*(void *)(*((void *)&v11 + 1) + 8 * v8));
            if (objc_msgSend(*(id *)(v9 + 24), "hasGreenTeaWithValue:", a2, (void)v11))
            {

              return 1;
            }
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    -[GEOPDSPunchInHints _readTappedResultHint](v3);
    uint64_t v10 = *(void *)(v3 + 48);
    if (v10
      && (-[GEOPDSPunchInResultHints _readCenter](v10),
          ([*(id *)(v10 + 24) hasGreenTeaWithValue:a2] & 1) != 0))
    {
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
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
      GEOPDSPunchInHintsReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSPunchInHints readAll:]((uint64_t)self, 0);
  uint64_t v8 = [(NSString *)self->_appId copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  id v10 = [(GEOPDSPunchInQueryHints *)self->_queryHints copyWithZone:a3];
  long long v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v12 = self->_resultHints;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v21;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v15), "copyWithZone:", a3, (void)v20);
        -[GEOPDSPunchInHints addResultHints:](v5, v16);

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }

  id v17 = [(GEOPDSPunchInResultHints *)self->_tappedResultHint copyWithZone:a3];
  v18 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v17;

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOPDSPunchInHints readAll:]((uint64_t)self, 1),
         -[GEOPDSPunchInHints readAll:]((uint64_t)v4, 1),
         appId = self->_appId,
         !((unint64_t)appId | v4[3]))
     || -[NSString isEqual:](appId, "isEqual:"))
    && ((queryHints = self->_queryHints, !((unint64_t)queryHints | v4[4]))
     || -[GEOPDSPunchInQueryHints isEqual:](queryHints, "isEqual:"))
    && ((resultHints = self->_resultHints, !((unint64_t)resultHints | v4[5]))
     || -[NSMutableArray isEqual:](resultHints, "isEqual:")))
  {
    tappedResultHint = self->_tappedResultHint;
    if ((unint64_t)tappedResultHint | v4[6]) {
      char v9 = -[GEOPDSPunchInResultHints isEqual:](tappedResultHint, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  -[GEOPDSPunchInHints readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_appId hash];
  unint64_t v4 = [(GEOPDSPunchInQueryHints *)self->_queryHints hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_resultHints hash];
  return v4 ^ v5 ^ [(GEOPDSPunchInResultHints *)self->_tappedResultHint hash];
}

- (void)mergeFrom:(uint64_t)a1
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    -[GEOPDSPunchInHints readAll:]((uint64_t)v3, 0);
    uint64_t v5 = (void *)*((void *)v4 + 3);
    if (v5) {
      -[GEOPDSPunchInHints setAppId:](a1, v5);
    }
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = (void *)*((void *)v4 + 4);
    if (v6)
    {
      if (v7) {
        -[GEOPDSPunchInQueryHints mergeFrom:](v6, v7);
      }
    }
    else if (v7)
    {
      -[GEOPDSPunchInHints setQueryHints:](a1, v7);
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = *((id *)v4 + 5);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          -[GEOPDSPunchInHints addResultHints:](a1, *(void **)(*((void *)&v15 + 1) + 8 * v12++));
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }

    uint64_t v13 = *(void *)(a1 + 48);
    uint64_t v14 = (void *)*((void *)v4 + 6);
    if (v13)
    {
      if (v14) {
        -[GEOPDSPunchInResultHints mergeFrom:](v13, v14);
      }
    }
    else if (v14)
    {
      -[GEOPDSPunchInHints setTappedResultHint:](a1, v14);
    }
  }
}

- (void)clearUnknownFields:(uint64_t)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 68) |= 1u;
    *(unsigned char *)(a1 + 68) |= 0x20u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    id v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDSPunchInHints readAll:](a1, 0);
      -[GEOPDSPunchInQueryHints clearUnknownFields:](*(void *)(a1 + 32), 1);
      long long v12 = 0u;
      long long v13 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      id v5 = *(id *)(a1 + 40);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v11;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v11 != v8) {
              objc_enumerationMutation(v5);
            }
            -[GEOPDSPunchInResultHints clearUnknownFields:](*(void *)(*((void *)&v10 + 1) + 8 * v9++), 1);
          }
          while (v7 != v9);
          uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        }
        while (v7);
      }

      -[GEOPDSPunchInResultHints clearUnknownFields:](*(void *)(a1 + 48), 1);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tappedResultHint, 0);
  objc_storeStrong((id *)&self->_resultHints, 0);
  objc_storeStrong((id *)&self->_queryHints, 0);
  objc_storeStrong((id *)&self->_appId, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end