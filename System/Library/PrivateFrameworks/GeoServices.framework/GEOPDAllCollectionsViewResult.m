@interface GEOPDAllCollectionsViewResult
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDAllCollectionsViewResult)init;
- (GEOPDAllCollectionsViewResult)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)collectionIds;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)resultFilters;
- (unint64_t)hash;
- (void)_addNoFlagsCollectionId:(uint64_t)a1;
- (void)_addNoFlagsResultFilter:(uint64_t)a1;
- (void)_readCollectionIds;
- (void)_readPublisherSuggestionResult;
- (void)_readResultFilters;
- (void)addCollectionId:(uint64_t)a1;
- (void)addResultFilter:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setPublisherSuggestionResult:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDAllCollectionsViewResult

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDAllCollectionsViewResult;
  v4 = [(GEOPDAllCollectionsViewResult *)&v8 description];
  v5 = [(GEOPDAllCollectionsViewResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (void)addCollectionId:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDAllCollectionsViewResult _readCollectionIds](a1);
    -[GEOPDAllCollectionsViewResult _addNoFlagsCollectionId:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 60) |= 2u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    *(unsigned char *)(a1 + 60) |= 0x10u;
  }
}

- (void)_readPublisherSuggestionResult
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
  if ((*(unsigned char *)(a1 + 60) & 4) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDAllCollectionsViewResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPublisherSuggestionResult_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
}

- (void)_addNoFlagsCollectionId:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 24);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v6 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v5;

      v4 = *(void **)(a1 + 24);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (GEOPDAllCollectionsViewResult)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDAllCollectionsViewResult;
  id v3 = [(GEOPDAllCollectionsViewResult *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDAllCollectionsViewResult readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    -[GEOPDAllCollectionsViewResult _readPublisherSuggestionResult](a1);
    id v5 = *(id *)(a1 + 32);
    v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 jsonRepresentation];
        objc_super v8 = @"publisherSuggestionResult";
      }
      else
      {
        objc_super v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"publisher_suggestion_result";
      }
      [v4 setObject:v7 forKey:v8];
    }
    if ([*(id *)(a1 + 40) count])
    {
      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v10 = *(id *)(a1 + 40);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v40 objects:v45 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v41;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v41 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = *(void **)(*((void *)&v40 + 1) + 8 * i);
            if (a2) {
              [v15 jsonRepresentation];
            }
            else {
            v16 = [v15 dictionaryRepresentation];
            }
            [v9 addObject:v16];
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v40 objects:v45 count:16];
        }
        while (v12);
      }

      if (a2) {
        v17 = @"resultFilter";
      }
      else {
        v17 = @"result_filter";
      }
      [v4 setObject:v9 forKey:v17];
    }
    if ([*(id *)(a1 + 24) count])
    {
      v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v19 = *(id *)(a1 + 24);
      uint64_t v20 = [v19 countByEnumeratingWithState:&v36 objects:v44 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v37;
        do
        {
          for (uint64_t j = 0; j != v21; ++j)
          {
            if (*(void *)v37 != v22) {
              objc_enumerationMutation(v19);
            }
            v24 = *(void **)(*((void *)&v36 + 1) + 8 * j);
            if (a2) {
              [v24 jsonRepresentation];
            }
            else {
            v25 = [v24 dictionaryRepresentation];
            }
            [v18 addObject:v25];
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v36 objects:v44 count:16];
        }
        while (v21);
      }

      if (a2) {
        v26 = @"collectionId";
      }
      else {
        v26 = @"collection_id";
      }
      [v4 setObject:v18 forKey:v26];
    }
    v27 = *(void **)(a1 + 16);
    if (v27)
    {
      v28 = [v27 dictionaryRepresentation];
      v29 = v28;
      if (a2)
      {
        v30 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v28, "count"));
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __59__GEOPDAllCollectionsViewResult__dictionaryRepresentation___block_invoke;
        v34[3] = &unk_1E53D8860;
        id v31 = v30;
        id v35 = v31;
        [v29 enumerateKeysAndObjectsUsingBlock:v34];
        id v32 = v31;

        v29 = v32;
      }
      [v4 setObject:v29 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1E) == 0))
  {
    v14 = self->_reader;
    objc_sync_enter(v14);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v15 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v15];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v14);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDAllCollectionsViewResult readAll:]((uint64_t)self, 0);
    if (self->_publisherSuggestionResult) {
      PBDataWriterWriteSubmessage();
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v6 = self->_resultFilters;
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

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        v6 = (int *)&readAll__recursiveTag_228;
      }
      else {
        v6 = (int *)&readAll__nonRecursiveTag_229;
      }
      GEOPDAllCollectionsViewResultReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDAllCollectionsViewResultCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
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
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDAllCollectionsViewResultReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDAllCollectionsViewResult readAll:]((uint64_t)self, 0);
  id v8 = [(GEOPDPublisherSuggestionResult *)self->_publisherSuggestionResult copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v10 = self->_resultFilters;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v26;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v10);
        }
        v14 = (void *)[*(id *)(*((void *)&v25 + 1) + 8 * v13) copyWithZone:a3];
        -[GEOPDAllCollectionsViewResult addResultFilter:](v5, v14);

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v11);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v15 = self->_collectionIds;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v22;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v15);
        }
        long long v19 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v18), "copyWithZone:", a3, (void)v21);
        -[GEOPDAllCollectionsViewResult addCollectionId:](v5, v19);

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v16);
  }

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (void)_readResultFilters
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
        GEOPDAllCollectionsViewResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readResultFilters_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

void __59__GEOPDAllCollectionsViewResult__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    id v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    id v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (void)setPublisherSuggestionResult:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 60) |= 4u;
  *(unsigned char *)(a1 + 60) |= 0x10u;
  objc_storeStrong((id *)(a1 + 32), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultFilters, 0);
  objc_storeStrong((id *)&self->_publisherSuggestionResult, 0);
  objc_storeStrong((id *)&self->_collectionIds, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOPDAllCollectionsViewResult)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDAllCollectionsViewResult;
  v2 = [(GEOPDAllCollectionsViewResult *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (id)resultFilters
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDAllCollectionsViewResult _readResultFilters]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addResultFilter:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDAllCollectionsViewResult _readResultFilters](a1);
    -[GEOPDAllCollectionsViewResult _addNoFlagsResultFilter:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 60) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    *(unsigned char *)(a1 + 60) |= 0x10u;
  }
}

- (void)_addNoFlagsResultFilter:(uint64_t)a1
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

- (void)_readCollectionIds
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
        GEOPDAllCollectionsViewResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCollectionIds_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)collectionIds
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDAllCollectionsViewResult _readCollectionIds]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAllCollectionsViewResult _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)jsonRepresentation
{
  return -[GEOPDAllCollectionsViewResult _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDAllCollectionsViewResultReadAllFrom((uint64_t)self, a3, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOPDAllCollectionsViewResult readAll:]((uint64_t)self, 1),
         -[GEOPDAllCollectionsViewResult readAll:]((uint64_t)v4, 1),
         publisherSuggestionResult = self->_publisherSuggestionResult,
         !((unint64_t)publisherSuggestionResult | v4[4]))
     || -[GEOPDPublisherSuggestionResult isEqual:](publisherSuggestionResult, "isEqual:"))
    && ((resultFilters = self->_resultFilters, !((unint64_t)resultFilters | v4[5]))
     || -[NSMutableArray isEqual:](resultFilters, "isEqual:")))
  {
    collectionIds = self->_collectionIds;
    if ((unint64_t)collectionIds | v4[3]) {
      char v8 = -[NSMutableArray isEqual:](collectionIds, "isEqual:");
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
  -[GEOPDAllCollectionsViewResult readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOPDPublisherSuggestionResult *)self->_publisherSuggestionResult hash];
  uint64_t v4 = [(NSMutableArray *)self->_resultFilters hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_collectionIds hash];
}

@end