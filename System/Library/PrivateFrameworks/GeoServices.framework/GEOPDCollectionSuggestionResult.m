@interface GEOPDCollectionSuggestionResult
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDCollectionSuggestionResult)init;
- (GEOPDCollectionSuggestionResult)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)collectionIds;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)exploreGuidesMetadata;
- (id)jsonRepresentation;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (uint64_t)hasGreenTeaWithValue:(uint64_t)result;
- (unint64_t)hash;
- (void)_addNoFlagsCollectionId:(uint64_t)a1;
- (void)_readCollectionIds;
- (void)_readExploreGuidesMetadata;
- (void)addCollectionId:(uint64_t)a1;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setExploreGuidesMetadata:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDCollectionSuggestionResult

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
        GEOPDCollectionSuggestionResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCollectionIds_tags_2766);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (void)_readExploreGuidesMetadata
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
        GEOPDCollectionSuggestionResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readExploreGuidesMetadata_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)exploreGuidesMetadata
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDCollectionSuggestionResult _readExploreGuidesMetadata]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (GEOPDCollectionSuggestionResult)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDCollectionSuggestionResult;
  v2 = [(GEOPDCollectionSuggestionResult *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (id)collectionIds
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDCollectionSuggestionResult _readCollectionIds]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exploreGuidesMetadata, 0);
  objc_storeStrong((id *)&self->_collectionIds, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOPDCollectionSuggestionResult)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDCollectionSuggestionResult;
  id v3 = [(GEOPDCollectionSuggestionResult *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)addCollectionId:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDCollectionSuggestionResult _readCollectionIds](a1);
    -[GEOPDCollectionSuggestionResult _addNoFlagsCollectionId:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 52) |= 2u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    *(unsigned char *)(a1 + 52) |= 8u;
  }
}

- (void)setExploreGuidesMetadata:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 52) |= 4u;
  *(unsigned char *)(a1 + 52) |= 8u;
  objc_storeStrong((id *)(a1 + 32), a2);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDCollectionSuggestionResult;
  id v4 = [(GEOPDCollectionSuggestionResult *)&v8 description];
  id v5 = [(GEOPDCollectionSuggestionResult *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDCollectionSuggestionResult _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDCollectionSuggestionResult readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 24) count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v6 = *(id *)(a1 + 24);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v28 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v8);
      }

      if (a2) {
        v13 = @"collectionId";
      }
      else {
        v13 = @"collection_id";
      }
      [v4 setObject:v5 forKey:v13];
    }
    v14 = -[GEOPDCollectionSuggestionResult exploreGuidesMetadata]((id *)a1);
    v15 = v14;
    if (v14)
    {
      if (a2)
      {
        v16 = [v14 jsonRepresentation];
        v17 = @"exploreGuidesMetadata";
      }
      else
      {
        v16 = [v14 dictionaryRepresentation];
        v17 = @"explore_guides_metadata";
      }
      [v4 setObject:v16 forKey:v17];
    }
    v18 = *(void **)(a1 + 16);
    if (v18)
    {
      v19 = [v18 dictionaryRepresentation];
      v20 = v19;
      if (a2)
      {
        v21 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v19, "count"));
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __61__GEOPDCollectionSuggestionResult__dictionaryRepresentation___block_invoke;
        v25[3] = &unk_1E53D8860;
        id v22 = v21;
        id v26 = v22;
        [v20 enumerateKeysAndObjectsUsingBlock:v25];
        id v23 = v22;

        v20 = v23;
      }
      [v4 setObject:v20 forKey:@"Unknown Fields"];
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
  return -[GEOPDCollectionSuggestionResult _dictionaryRepresentation:]((uint64_t)self, 1);
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
        id v6 = (int *)&readAll__recursiveTag_2774;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_2775;
      }
      GEOPDCollectionSuggestionResultReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDCollectionSuggestionResultCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

void __61__GEOPDCollectionSuggestionResult__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = [a1 init];
  if (v6)
  {
    if (a3) {
      uint64_t v7 = @"collectionId";
    }
    else {
      uint64_t v7 = @"collection_id";
    }
    uint64_t v8 = [v5 objectForKeyedSubscript:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v23 = v5;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v25 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v24 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v15 = [GEOPDMapsIdentifier alloc];
              if (a3) {
                v16 = [(GEOPDMapsIdentifier *)v15 initWithJSON:v14];
              }
              else {
                v16 = [(GEOPDMapsIdentifier *)v15 initWithDictionary:v14];
              }
              v17 = v16;
              -[GEOPDCollectionSuggestionResult addCollectionId:](v6, v16);
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v11);
      }

      id v5 = v23;
    }

    if (a3) {
      v18 = @"exploreGuidesMetadata";
    }
    else {
      v18 = @"explore_guides_metadata";
    }
    v19 = [v5 objectForKeyedSubscript:v18];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20 = [GEOPDExploreGuides alloc];
      if (v20) {
        v21 = -[GEOPDExploreGuides _initWithDictionary:isJSON:](v20, v19, a3);
      }
      else {
        v21 = 0;
      }
      -[GEOPDCollectionSuggestionResult setExploreGuidesMetadata:](v6, v21);
    }
  }

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDCollectionSuggestionResultReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDCollectionSuggestionResultIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v10 = self->_reader;
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
    -[GEOPDCollectionSuggestionResult readAll:]((uint64_t)self, 0);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v6 = self->_collectionIds;
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

    if (self->_exploreGuidesMetadata) {
      PBDataWriterWriteSubmessage();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
  }
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    -[GEOPDCollectionSuggestionResult _readCollectionIds](result);
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v4 = *(id *)(v3 + 24);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      while (2)
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          if (objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8), "hasGreenTeaWithValue:", a2, (void)v9))
          {

            return 1;
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    -[GEOPDCollectionSuggestionResult _readExploreGuidesMetadata](v3);
    return -[GEOPDExploreGuides hasGreenTeaWithValue:](*(void *)(v3 + 32), a2);
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
      GEOPDCollectionSuggestionResultReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDCollectionSuggestionResult readAll:]((uint64_t)self, 0);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = self->_collectionIds;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v8);
        }
        long long v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v11), "copyWithZone:", a3, (void)v16);
        -[GEOPDCollectionSuggestionResult addCollectionId:](v5, v12);

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  id v13 = [(GEOPDExploreGuides *)self->_exploreGuidesMetadata copyWithZone:a3];
  uint64_t v14 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v13;

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOPDCollectionSuggestionResult readAll:]((uint64_t)self, 1),
         -[GEOPDCollectionSuggestionResult readAll:]((uint64_t)v4, 1),
         collectionIds = self->_collectionIds,
         !((unint64_t)collectionIds | v4[3]))
     || -[NSMutableArray isEqual:](collectionIds, "isEqual:")))
  {
    exploreGuidesMetadata = self->_exploreGuidesMetadata;
    if ((unint64_t)exploreGuidesMetadata | v4[4]) {
      char v7 = -[GEOPDExploreGuides isEqual:](exploreGuidesMetadata, "isEqual:");
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
  -[GEOPDCollectionSuggestionResult readAll:]((uint64_t)self, 1);
  uint64_t v3 = [(NSMutableArray *)self->_collectionIds hash];
  return [(GEOPDExploreGuides *)self->_exploreGuidesMetadata hash] ^ v3;
}

- (void)clearUnknownFields:(uint64_t)a1
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 52) |= 1u;
    *(unsigned char *)(a1 + 52) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    v2 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    -[GEOPDCollectionSuggestionResult readAll:](a1, 0);
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v3 = *(id *)(a1 + 24);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "clearUnknownFields:", 1, (void)v8);
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }

    -[GEOPDExploreGuides clearUnknownFields:](*(void *)(a1 + 32), 1);
  }
}

@end