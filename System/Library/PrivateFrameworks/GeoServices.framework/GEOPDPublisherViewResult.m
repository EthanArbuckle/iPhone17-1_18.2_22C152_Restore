@interface GEOPDPublisherViewResult
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDPublisherViewResult)init;
- (GEOPDPublisherViewResult)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)collectionIds;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)resultFilters;
- (uint64_t)hasGreenTeaWithValue:(uint64_t)a1;
- (unint64_t)hash;
- (void)_addNoFlagsCollectionId:(uint64_t)a1;
- (void)_addNoFlagsResultFilter:(uint64_t)a1;
- (void)_readCollectionIds;
- (void)_readResultFilters;
- (void)addCollectionId:(uint64_t)a1;
- (void)addResultFilter:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDPublisherViewResult

- (uint64_t)hasGreenTeaWithValue:(uint64_t)a1
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  -[GEOPDPublisherViewResult _readCollectionIds](a1);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = *(id *)(a1 + 24);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
LABEL_4:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v20 != v7) {
        objc_enumerationMutation(v4);
      }
      if ([*(id *)(*((void *)&v19 + 1) + 8 * v8) hasGreenTeaWithValue:a2]) {
        goto LABEL_19;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
        if (v6) {
          goto LABEL_4;
        }
        break;
      }
    }
  }

  -[GEOPDPublisherViewResult _readResultFilters](a1);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v9 = [v4 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
LABEL_12:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v16 != v11) {
        objc_enumerationMutation(v4);
      }
      if (-[GEOPDPublisherViewResultFilter hasGreenTeaWithValue:](*(void *)(*((void *)&v15 + 1) + 8 * v12), a2)) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v4 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v10) {
          goto LABEL_12;
        }
        goto LABEL_18;
      }
    }
LABEL_19:
    uint64_t v13 = 1;
    goto LABEL_20;
  }
LABEL_18:
  uint64_t v13 = 0;
LABEL_20:

  return v13;
}

- (GEOPDPublisherViewResult)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDPublisherViewResult;
  v2 = [(GEOPDPublisherViewResult *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (GEOPDPublisherViewResult)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDPublisherViewResult;
  v3 = [(GEOPDPublisherViewResult *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (void)_readResultFilters
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPublisherViewResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readResultFilters_tags_6227);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)resultFilters
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPublisherViewResult _readResultFilters]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addResultFilter:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDPublisherViewResult _readResultFilters](a1);
    -[GEOPDPublisherViewResult _addNoFlagsResultFilter:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 52) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    *(unsigned char *)(a1 + 52) |= 8u;
  }
}

- (void)_addNoFlagsResultFilter:(uint64_t)a1
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

- (void)_readCollectionIds
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPublisherViewResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCollectionIds_tags_6228);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)collectionIds
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPublisherViewResult _readCollectionIds]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addCollectionId:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDPublisherViewResult _readCollectionIds](a1);
    -[GEOPDPublisherViewResult _addNoFlagsCollectionId:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 52) |= 2u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    *(unsigned char *)(a1 + 52) |= 8u;
  }
}

- (void)_addNoFlagsCollectionId:(uint64_t)a1
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

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDPublisherViewResult;
  id v4 = [(GEOPDPublisherViewResult *)&v8 description];
  id v5 = [(GEOPDPublisherViewResult *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPublisherViewResult _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDPublisherViewResult readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 32) count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v6 = *(id *)(a1 + 32);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v36 objects:v41 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v37;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v37 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = *(void **)(*((void *)&v36 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            uint64_t v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v36 objects:v41 count:16];
        }
        while (v8);
      }

      if (a2) {
        uint64_t v13 = @"resultFilter";
      }
      else {
        uint64_t v13 = @"result_filter";
      }
      [v4 setObject:v5 forKey:v13];
    }
    if ([*(id *)(a1 + 24) count])
    {
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v15 = *(id *)(a1 + 24);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v32 objects:v40 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v33;
        do
        {
          for (uint64_t j = 0; j != v17; ++j)
          {
            if (*(void *)v33 != v18) {
              objc_enumerationMutation(v15);
            }
            long long v20 = *(void **)(*((void *)&v32 + 1) + 8 * j);
            if (a2) {
              [v20 jsonRepresentation];
            }
            else {
            long long v21 = [v20 dictionaryRepresentation];
            }
            [v14 addObject:v21];
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v32 objects:v40 count:16];
        }
        while (v17);
      }

      if (a2) {
        long long v22 = @"collectionId";
      }
      else {
        long long v22 = @"collection_id";
      }
      [v4 setObject:v14 forKey:v22];
    }
    v23 = *(void **)(a1 + 16);
    if (v23)
    {
      v24 = [v23 dictionaryRepresentation];
      uint64_t v25 = v24;
      if (a2)
      {
        v26 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v24, "count"));
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __54__GEOPDPublisherViewResult__dictionaryRepresentation___block_invoke;
        v30[3] = &unk_1E53D8860;
        id v27 = v26;
        id v31 = v27;
        [v25 enumerateKeysAndObjectsUsingBlock:v30];
        id v28 = v27;

        uint64_t v25 = v28;
      }
      [v4 setObject:v25 forKey:@"Unknown Fields"];
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
  return -[GEOPDPublisherViewResult _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_6229;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_6230;
      }
      GEOPDPublisherViewResultReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDPublisherViewResultCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

void __54__GEOPDPublisherViewResult__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDPublisherViewResultReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0xE) == 0))
  {
    v14 = self->_reader;
    objc_sync_enter(v14);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v15 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v15];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v14);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDPublisherViewResult readAll:]((uint64_t)self, 0);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v6 = self->_resultFilters;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v21;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v7);
    }

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v10 = self->_collectionIds;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v17;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v11);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v16);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 8) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDPublisherViewResultReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDPublisherViewResult readAll:]((uint64_t)self, 0);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v8 = self->_resultFilters;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v24;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = (void *)[*(id *)(*((void *)&v23 + 1) + 8 * v11) copyWithZone:a3];
        -[GEOPDPublisherViewResult addResultFilter:]((uint64_t)v5, v12);

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v9);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v13 = self->_collectionIds;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v13);
        }
        long long v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v16), "copyWithZone:", a3, (void)v19);
        -[GEOPDPublisherViewResult addCollectionId:]((uint64_t)v5, v17);

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }

  objc_storeStrong(v5 + 2, self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOPDPublisherViewResult readAll:]((uint64_t)self, 1),
         -[GEOPDPublisherViewResult readAll:]((uint64_t)v4, 1),
         resultFilters = self->_resultFilters,
         !((unint64_t)resultFilters | v4[4]))
     || -[NSMutableArray isEqual:](resultFilters, "isEqual:")))
  {
    collectionIds = self->_collectionIds;
    if ((unint64_t)collectionIds | v4[3]) {
      char v7 = -[NSMutableArray isEqual:](collectionIds, "isEqual:");
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
  -[GEOPDPublisherViewResult readAll:]((uint64_t)self, 1);
  uint64_t v3 = [(NSMutableArray *)self->_resultFilters hash];
  return [(NSMutableArray *)self->_collectionIds hash] ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultFilters, 0);
  objc_storeStrong((id *)&self->_collectionIds, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end