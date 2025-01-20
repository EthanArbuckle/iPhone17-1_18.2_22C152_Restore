@interface GEOPDSearchQueryGeoTagMetadata
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSearchQueryGeoTagMetadata)init;
- (GEOPDSearchQueryGeoTagMetadata)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_addNoFlagsGeoTypeMap:(uint64_t)a1;
- (void)addGeoTypeMap:(uint64_t)a1;
- (void)dealloc;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchQueryGeoTagMetadata

- (GEOPDSearchQueryGeoTagMetadata)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchQueryGeoTagMetadata;
  v2 = [(GEOPDSearchQueryGeoTagMetadata *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchQueryGeoTagMetadata)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchQueryGeoTagMetadata;
  v3 = [(GEOPDSearchQueryGeoTagMetadata *)&v7 initWithData:a3];
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
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDSearchQueryGeoTagMetadata;
  [(GEOPDSearchQueryGeoTagMetadata *)&v3 dealloc];
}

- (void)addGeoTypeMap:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 92) & 8) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchQueryGeoTagMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readGeoTypeMaps_tags);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    -[GEOPDSearchQueryGeoTagMetadata _addNoFlagsGeoTypeMap:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 92) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    *(unsigned char *)(a1 + 92) |= 0x10u;
  }
}

- (void)_addNoFlagsGeoTypeMap:(uint64_t)a1
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
  v8.super_class = (Class)GEOPDSearchQueryGeoTagMetadata;
  v4 = [(GEOPDSearchQueryGeoTagMetadata *)&v8 description];
  id v5 = [(GEOPDSearchQueryGeoTagMetadata *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchQueryGeoTagMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDSearchQueryGeoTagMetadata readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(void *)(a1 + 48))
    {
      id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      objc_super v6 = (void *)(a1 + 40);
      if (*(void *)(a1 + 48))
      {
        unint64_t v7 = 0;
        do
        {
          uint64_t v8 = *(unsigned int *)(*v6 + 4 * v7);
          if ((v8 - 1) >= 0x1C)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
            v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v9 = off_1E53E2750[(int)v8 - 1];
          }
          [v5 addObject:v9];

          ++v7;
          objc_super v6 = (void *)(a1 + 40);
        }
        while (v7 < *(void *)(a1 + 48));
      }
      if (a2) {
        v10 = @"tagSources";
      }
      else {
        v10 = @"tag_sources";
      }
      [v4 setObject:v5 forKey:v10];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 92) & 4) == 0)
    {
      v11 = *(void **)(a1 + 8);
      if (v11)
      {
        id v12 = v11;
        objc_sync_enter(v12);
        GEOPDSearchQueryGeoTagMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readGeoParsingResult_tags);
        objc_sync_exit(v12);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    id v13 = *(id *)(a1 + 64);
    v14 = v13;
    if (v13)
    {
      if (a2)
      {
        v15 = [v13 jsonRepresentation];
        v16 = @"geoParsingResult";
      }
      else
      {
        v15 = [v13 dictionaryRepresentation];
        v16 = @"geo_parsing_result";
      }
      [v4 setObject:v15 forKey:v16];
    }
    if ([*(id *)(a1 + 72) count])
    {
      v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 72), "count"));
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v18 = *(id *)(a1 + 72);
      uint64_t v19 = [v18 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v19)
      {
        uint64_t v20 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v33 != v20) {
              objc_enumerationMutation(v18);
            }
            v22 = *(void **)(*((void *)&v32 + 1) + 8 * i);
            if (a2) {
              [v22 jsonRepresentation];
            }
            else {
            v23 = [v22 dictionaryRepresentation];
            }
            [v17 addObject:v23];
          }
          uint64_t v19 = [v18 countByEnumeratingWithState:&v32 objects:v36 count:16];
        }
        while (v19);
      }

      if (a2) {
        v24 = @"geoTypeMap";
      }
      else {
        v24 = @"geo_type_map";
      }
      [v4 setObject:v17 forKey:v24];
    }
    if (*(void *)(a1 + 24))
    {
      v25 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      v26 = (void *)(a1 + 16);
      if (*(void *)(a1 + 24))
      {
        unint64_t v27 = 0;
        do
        {
          uint64_t v28 = *(unsigned int *)(*v26 + 4 * v27);
          if ((v28 - 1) >= 6)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v28);
            v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v29 = off_1E53E2830[(int)v28 - 1];
          }
          [v25 addObject:v29];

          ++v27;
          v26 = (void *)(a1 + 16);
        }
        while (v27 < *(void *)(a1 + 24));
      }
      if (a2) {
        v30 = @"geoRewriteTypes";
      }
      else {
        v30 = @"geo_rewrite_types";
      }
      [v4 setObject:v25 forKey:v30];
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
  return -[GEOPDSearchQueryGeoTagMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
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
        objc_super v6 = (int *)&readAll__recursiveTag_1487;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_1488;
      }
      GEOPDSearchQueryGeoTagMetadataReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDSearchQueryGeoTagMetadataCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchQueryGeoTagMetadataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDSearchQueryGeoTagMetadataIsDirty((uint64_t)self) & 1) == 0)
  {
    id v13 = self->_reader;
    objc_sync_enter(v13);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v14 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v14];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v13);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchQueryGeoTagMetadata readAll:]((uint64_t)self, 0);
    if (self->_tagSources.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v6;
      }
      while (v6 < self->_tagSources.count);
    }
    if (self->_geoParsingResult) {
      PBDataWriterWriteSubmessage();
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    unint64_t v7 = self->_geoTypeMaps;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v7);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }

    p_geoRewriteTypes = &self->_geoRewriteTypes;
    if (p_geoRewriteTypes->count)
    {
      unint64_t v12 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v12;
      }
      while (v12 < p_geoRewriteTypes->count);
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
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDSearchQueryGeoTagMetadataReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchQueryGeoTagMetadata readAll:]((uint64_t)self, 0);
  PBRepeatedInt32Copy();
  id v8 = [(GEOPDSearchGeoParsingResult *)self->_geoParsingResult copyWithZone:a3];
  uint64_t v9 = (void *)v5[8];
  v5[8] = v8;

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v10 = self->_geoTypeMaps;
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
        v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "copyWithZone:", a3, (void)v16);
        -[GEOPDSearchQueryGeoTagMetadata addGeoTypeMap:]((uint64_t)v5, v14);
      }
      uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  PBRepeatedInt32Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (-[GEOPDSearchQueryGeoTagMetadata readAll:]((uint64_t)self, 1),
        -[GEOPDSearchQueryGeoTagMetadata readAll:]((uint64_t)v4, 1),
        PBRepeatedInt32IsEqual())
    && ((geoParsingResult = self->_geoParsingResult, !((unint64_t)geoParsingResult | v4[8]))
     || -[GEOPDSearchGeoParsingResult isEqual:](geoParsingResult, "isEqual:"))
    && ((geoTypeMaps = self->_geoTypeMaps, !((unint64_t)geoTypeMaps | v4[9]))
     || -[NSMutableArray isEqual:](geoTypeMaps, "isEqual:")))
  {
    char IsEqual = PBRepeatedInt32IsEqual();
  }
  else
  {
    char IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  -[GEOPDSearchQueryGeoTagMetadata readAll:]((uint64_t)self, 1);
  uint64_t v3 = PBRepeatedInt32Hash();
  unint64_t v4 = [(GEOPDSearchGeoParsingResult *)self->_geoParsingResult hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_geoTypeMaps hash];
  return v4 ^ v5 ^ PBRepeatedInt32Hash();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geoTypeMaps, 0);
  objc_storeStrong((id *)&self->_geoParsingResult, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end