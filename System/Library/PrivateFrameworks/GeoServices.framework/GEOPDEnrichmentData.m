@interface GEOPDEnrichmentData
+ (GEOPDEnrichmentData)enrichmentDataWithPlaceData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDEnrichmentData)init;
- (GEOPDEnrichmentData)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)entitys;
- (id)jsonRepresentation;
- (id)placecardEnrichmentMetadata;
- (unint64_t)hash;
- (void)_addNoFlagsEntity:(uint64_t)a1;
- (void)_readEntitys;
- (void)_readPlacecardEnrichmentMetadata;
- (void)addEntity:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDEnrichmentData

+ (GEOPDEnrichmentData)enrichmentDataWithPlaceData:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__37;
  v11 = __Block_byref_object_dispose__37;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__GEOPDEnrichmentData_PlaceDataExtras__enrichmentDataWithPlaceData___block_invoke;
  v6[3] = &unk_1E53E1740;
  v6[4] = &v7;
  [v3 enumerateComponentOfType:95 enumerationOptions:1 usingBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (GEOPDEnrichmentData *)v4;
}

void __68__GEOPDEnrichmentData_PlaceDataExtras__enrichmentDataWithPlaceData___block_invoke(uint64_t a1, id *a2, unsigned char *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = -[GEOPDComponent values](a2);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * v9);
        if (v10 && *(void *)(v10 + 176))
        {
          uint64_t v11 = -[GEOPDComponentValue enrichmentData]((id *)v10);
          uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
          v13 = *(void **)(v12 + 40);
          *(void *)(v12 + 40) = v11;

          *a3 = 1;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (GEOPDEnrichmentData)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDEnrichmentData;
  v2 = [(GEOPDEnrichmentData *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (GEOPDEnrichmentData)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDEnrichmentData;
  id v3 = [(GEOPDEnrichmentData *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readEntitys
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
        GEOPDEnrichmentDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEntitys_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)entitys
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDEnrichmentData _readEntitys]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addEntity:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDEnrichmentData _readEntitys](a1);
    -[GEOPDEnrichmentData _addNoFlagsEntity:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 52) |= 2u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    *(unsigned char *)(a1 + 52) |= 8u;
  }
}

- (void)_addNoFlagsEntity:(uint64_t)a1
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

- (void)_readPlacecardEnrichmentMetadata
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
        GEOPDEnrichmentDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlacecardEnrichmentMetadata_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)placecardEnrichmentMetadata
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDEnrichmentData _readPlacecardEnrichmentMetadata]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDEnrichmentData;
  id v4 = [(GEOPDEnrichmentData *)&v8 description];
  id v5 = [(GEOPDEnrichmentData *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDEnrichmentData _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDEnrichmentData readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 24) count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v6 = *(id *)(a1 + 24);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v26 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            uint64_t v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v8);
      }

      [v4 setObject:v5 forKey:@"entity"];
    }
    v13 = -[GEOPDEnrichmentData placecardEnrichmentMetadata]((id *)a1);
    long long v14 = v13;
    if (v13)
    {
      if (a2)
      {
        long long v15 = [v13 base64EncodedStringWithOptions:0];
        [v4 setObject:v15 forKey:@"placecardEnrichmentMetadata"];
      }
      else
      {
        [v4 setObject:v13 forKey:@"placecard_enrichment_metadata"];
      }
    }

    long long v16 = *(void **)(a1 + 16);
    if (v16)
    {
      long long v17 = [v16 dictionaryRepresentation];
      v18 = v17;
      if (a2)
      {
        uint64_t v19 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v17, "count"));
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __49__GEOPDEnrichmentData__dictionaryRepresentation___block_invoke;
        v23[3] = &unk_1E53D8860;
        id v20 = v19;
        id v24 = v20;
        [v18 enumerateKeysAndObjectsUsingBlock:v23];
        id v21 = v20;

        v18 = v21;
      }
      [v4 setObject:v18 forKey:@"Unknown Fields"];
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
  return -[GEOPDEnrichmentData _dictionaryRepresentation:]((uint64_t)self, 1);
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
        id v6 = (int *)&readAll__recursiveTag_4291;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_4292;
      }
      GEOPDEnrichmentDataReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDEnrichmentDataCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

void __49__GEOPDEnrichmentData__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDEnrichmentDataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0xE) == 0))
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
    -[GEOPDEnrichmentData readAll:]((uint64_t)self, 0);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = self->_entitys;
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

    if (self->_placecardEnrichmentMetadata) {
      PBDataWriterWriteDataField();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
  }
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
      GEOPDEnrichmentDataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDEnrichmentData readAll:]((uint64_t)self, 0);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = self->_entitys;
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
        -[GEOPDEnrichmentData addEntity:](v5, v12);

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  uint64_t v13 = [(NSData *)self->_placecardEnrichmentMetadata copyWithZone:a3];
  long long v14 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v13;

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOPDEnrichmentData readAll:]((uint64_t)self, 1),
         -[GEOPDEnrichmentData readAll:]((uint64_t)v4, 1),
         entitys = self->_entitys,
         !((unint64_t)entitys | v4[3]))
     || -[NSMutableArray isEqual:](entitys, "isEqual:")))
  {
    placecardEnrichmentMetadata = self->_placecardEnrichmentMetadata;
    if ((unint64_t)placecardEnrichmentMetadata | v4[4]) {
      char v7 = -[NSData isEqual:](placecardEnrichmentMetadata, "isEqual:");
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
  -[GEOPDEnrichmentData readAll:]((uint64_t)self, 1);
  uint64_t v3 = [(NSMutableArray *)self->_entitys hash];
  return [(NSData *)self->_placecardEnrichmentMetadata hash] ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placecardEnrichmentMetadata, 0);
  objc_storeStrong((id *)&self->_entitys, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end