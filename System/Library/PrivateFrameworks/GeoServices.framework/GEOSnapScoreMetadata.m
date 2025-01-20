@interface GEOSnapScoreMetadata
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOSnapScoreMetadata)init;
- (GEOSnapScoreMetadata)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)hasGreenTeaWithValue:(uint64_t)result;
- (unint64_t)hash;
- (void)_addNoFlagsDestinationAccessPoint:(uint64_t)a1;
- (void)_addNoFlagsDestinationPoint:(uint64_t)a1;
- (void)_addNoFlagsOriginAccessPoint:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readDestinationAccessPoints;
- (void)_readDestinationPoints;
- (void)_readOriginAccessPoints;
- (void)_readOriginPoint;
- (void)addDestinationAccessPoint:(uint64_t)a1;
- (void)addDestinationPoint:(uint64_t)a1;
- (void)addOriginAccessPoint:(uint64_t)a1;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)mergeFrom:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setOriginPoint:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOSnapScoreMetadata

- (GEOSnapScoreMetadata)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOSnapScoreMetadata;
  v2 = [(GEOSnapScoreMetadata *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOSnapScoreMetadata)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOSnapScoreMetadata;
  v3 = [(GEOSnapScoreMetadata *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readOriginPoint
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  if ((*(unsigned char *)(a1 + 68) & 0x10) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOSnapScoreMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOriginPoint_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
}

- (void)setOriginPoint:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 68) |= 0x10u;
  *(unsigned char *)(a1 + 68) |= 0x20u;
  objc_storeStrong((id *)(a1 + 48), a2);
}

- (void)_readOriginAccessPoints
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  if ((*(unsigned char *)(a1 + 68) & 8) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOSnapScoreMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOriginAccessPoints_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
}

- (void)addOriginAccessPoint:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOSnapScoreMetadata _readOriginAccessPoints](a1);
    -[GEOSnapScoreMetadata _addNoFlagsOriginAccessPoint:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 68) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(unsigned char *)(a1 + 68) |= 0x20u;
  }
}

- (void)_addNoFlagsOriginAccessPoint:(uint64_t)a1
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

- (void)_readDestinationPoints
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  if ((*(unsigned char *)(a1 + 68) & 4) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOSnapScoreMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDestinationPoints_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
}

- (void)addDestinationPoint:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOSnapScoreMetadata _readDestinationPoints](a1);
    -[GEOSnapScoreMetadata _addNoFlagsDestinationPoint:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 68) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(unsigned char *)(a1 + 68) |= 0x20u;
  }
}

- (void)_addNoFlagsDestinationPoint:(uint64_t)a1
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

- (void)_readDestinationAccessPoints
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  if ((*(unsigned char *)(a1 + 68) & 2) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOSnapScoreMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDestinationAccessPoints_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
}

- (void)addDestinationAccessPoint:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOSnapScoreMetadata _readDestinationAccessPoints](a1);
    -[GEOSnapScoreMetadata _addNoFlagsDestinationAccessPoint:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 68) |= 2u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(unsigned char *)(a1 + 68) |= 0x20u;
  }
}

- (void)_addNoFlagsDestinationAccessPoint:(uint64_t)a1
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
  v8.super_class = (Class)GEOSnapScoreMetadata;
  id v4 = [(GEOSnapScoreMetadata *)&v8 description];
  id v5 = [(GEOSnapScoreMetadata *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOSnapScoreMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOSnapScoreMetadata readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    -[GEOSnapScoreMetadata _readOriginPoint](a1);
    id v5 = *(id *)(a1 + 48);
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        id v7 = [v5 jsonRepresentation];
        objc_super v8 = @"originPoint";
      }
      else
      {
        id v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"origin_point";
      }
      [v4 setObject:v7 forKey:v8];
    }
    if ([*(id *)(a1 + 40) count])
    {
      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v10 = *(id *)(a1 + 40);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v53 objects:v59 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v54;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v54 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = *(void **)(*((void *)&v53 + 1) + 8 * i);
            if (a2) {
              [v15 jsonRepresentation];
            }
            else {
            v16 = [v15 dictionaryRepresentation];
            }
            [v9 addObject:v16];
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v53 objects:v59 count:16];
        }
        while (v12);
      }

      if (a2) {
        v17 = @"originAccessPoint";
      }
      else {
        v17 = @"origin_access_point";
      }
      [v4 setObject:v9 forKey:v17];
    }
    if ([*(id *)(a1 + 32) count])
    {
      v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v19 = *(id *)(a1 + 32);
      uint64_t v20 = [v19 countByEnumeratingWithState:&v49 objects:v58 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v50;
        do
        {
          for (uint64_t j = 0; j != v21; ++j)
          {
            if (*(void *)v50 != v22) {
              objc_enumerationMutation(v19);
            }
            v24 = *(void **)(*((void *)&v49 + 1) + 8 * j);
            if (a2) {
              [v24 jsonRepresentation];
            }
            else {
            v25 = [v24 dictionaryRepresentation];
            }
            [v18 addObject:v25];
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v49 objects:v58 count:16];
        }
        while (v21);
      }

      if (a2) {
        v26 = @"destinationPoint";
      }
      else {
        v26 = @"destination_point";
      }
      [v4 setObject:v18 forKey:v26];
    }
    if ([*(id *)(a1 + 24) count])
    {
      v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v28 = *(id *)(a1 + 24);
      uint64_t v29 = [v28 countByEnumeratingWithState:&v45 objects:v57 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v46;
        do
        {
          for (uint64_t k = 0; k != v30; ++k)
          {
            if (*(void *)v46 != v31) {
              objc_enumerationMutation(v28);
            }
            v33 = *(void **)(*((void *)&v45 + 1) + 8 * k);
            if (a2) {
              [v33 jsonRepresentation];
            }
            else {
            v34 = [v33 dictionaryRepresentation];
            }
            [v27 addObject:v34];
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v45 objects:v57 count:16];
        }
        while (v30);
      }

      if (a2) {
        v35 = @"destinationAccessPoint";
      }
      else {
        v35 = @"destination_access_point";
      }
      [v4 setObject:v27 forKey:v35];
    }
    v36 = *(void **)(a1 + 16);
    if (v36)
    {
      v37 = [v36 dictionaryRepresentation];
      v38 = v37;
      if (a2)
      {
        v39 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v37, "count"));
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __50__GEOSnapScoreMetadata__dictionaryRepresentation___block_invoke;
        v43[3] = &unk_1E53D8860;
        id v40 = v39;
        id v44 = v40;
        [v38 enumerateKeysAndObjectsUsingBlock:v43];
        id v41 = v40;

        v38 = v41;
      }
      [v4 setObject:v38 forKey:@"Unknown Fields"];
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
  return -[GEOSnapScoreMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
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
        objc_super v6 = (int *)&readAll__recursiveTag_6852;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_6853;
      }
      GEOSnapScoreMetadataReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOSnapScoreMetadataCallReadAllRecursiveWithoutSynchronized((id *)a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __50__GEOSnapScoreMetadata__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"originPoint";
      }
      else {
        objc_super v6 = @"origin_point";
      }
      id v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEOSnapScorePoint alloc];
        if (a3) {
          v9 = [(GEOSnapScorePoint *)v8 initWithJSON:v7];
        }
        else {
          v9 = [(GEOSnapScorePoint *)v8 initWithDictionary:v7];
        }
        id v10 = v9;
        -[GEOSnapScoreMetadata setOriginPoint:]((uint64_t)a1, v9);
      }
      if (a3) {
        uint64_t v11 = @"originAccessPoint";
      }
      else {
        uint64_t v11 = @"origin_access_point";
      }
      uint64_t v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      id v45 = v5;
      if (objc_opt_isKindOfClass())
      {
        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        id v13 = v12;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v54 objects:v60 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v55;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v55 != v16) {
                objc_enumerationMutation(v13);
              }
              uint64_t v18 = *(void *)(*((void *)&v54 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v19 = [GEOSnapScorePoint alloc];
                if (a3) {
                  uint64_t v20 = [(GEOSnapScorePoint *)v19 initWithJSON:v18];
                }
                else {
                  uint64_t v20 = [(GEOSnapScorePoint *)v19 initWithDictionary:v18];
                }
                uint64_t v21 = v20;
                -[GEOSnapScoreMetadata addOriginAccessPoint:]((uint64_t)a1, v20);
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v54 objects:v60 count:16];
          }
          while (v15);
        }

        id v5 = v45;
      }

      if (a3) {
        uint64_t v22 = @"destinationPoint";
      }
      else {
        uint64_t v22 = @"destination_point";
      }
      v23 = [v5 objectForKeyedSubscript:v22];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        id v24 = v23;
        uint64_t v25 = [v24 countByEnumeratingWithState:&v50 objects:v59 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v27 = *(void *)v51;
          do
          {
            for (uint64_t j = 0; j != v26; ++j)
            {
              if (*(void *)v51 != v27) {
                objc_enumerationMutation(v24);
              }
              uint64_t v29 = *(void *)(*((void *)&v50 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v30 = [GEOSnapScorePoint alloc];
                if (a3) {
                  uint64_t v31 = [(GEOSnapScorePoint *)v30 initWithJSON:v29];
                }
                else {
                  uint64_t v31 = [(GEOSnapScorePoint *)v30 initWithDictionary:v29];
                }
                v32 = v31;
                -[GEOSnapScoreMetadata addDestinationPoint:]((uint64_t)a1, v31);
              }
            }
            uint64_t v26 = [v24 countByEnumeratingWithState:&v50 objects:v59 count:16];
          }
          while (v26);
        }

        id v5 = v45;
      }

      if (a3) {
        v33 = @"destinationAccessPoint";
      }
      else {
        v33 = @"destination_access_point";
      }
      v34 = [v5 objectForKeyedSubscript:v33];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        id v35 = v34;
        uint64_t v36 = [v35 countByEnumeratingWithState:&v46 objects:v58 count:16];
        if (v36)
        {
          uint64_t v37 = v36;
          uint64_t v38 = *(void *)v47;
          do
          {
            for (uint64_t k = 0; k != v37; ++k)
            {
              if (*(void *)v47 != v38) {
                objc_enumerationMutation(v35);
              }
              uint64_t v40 = *(void *)(*((void *)&v46 + 1) + 8 * k);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v41 = [GEOSnapScorePoint alloc];
                if (a3) {
                  v42 = [(GEOSnapScorePoint *)v41 initWithJSON:v40];
                }
                else {
                  v42 = [(GEOSnapScorePoint *)v41 initWithDictionary:v40];
                }
                v43 = v42;
                -[GEOSnapScoreMetadata addDestinationAccessPoint:]((uint64_t)a1, v42);
              }
            }
            uint64_t v37 = [v35 countByEnumeratingWithState:&v46 objects:v58 count:16];
          }
          while (v37);
        }

        id v5 = v45;
      }
    }
  }

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOSnapScoreMetadataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOSnapScoreMetadataIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v18 = self->_reader;
    objc_sync_enter(v18);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v19 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v19];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v18);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOSnapScoreMetadata readAll:]((uint64_t)self, 0);
    if (self->_originPoint) {
      PBDataWriterWriteSubmessage();
    }
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    objc_super v6 = self->_originAccessPoints;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v29;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v29 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v28 objects:v34 count:16];
      }
      while (v7);
    }

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v10 = self->_destinationPoints;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v25;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
      }
      while (v11);
    }

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v14 = self->_destinationAccessPoints;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v20 objects:v32 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v21;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v14);
          }
          PBDataWriterWriteSubmessage();
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v20 objects:v32 count:16];
      }
      while (v15);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v20);
  }
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    id v3 = (id *)result;
    -[GEOSnapScoreMetadata _readDestinationAccessPoints](result);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v4 = v3[3];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v25 objects:v31 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v26;
LABEL_4:
      uint64_t v8 = 0;
      while (1)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v25 + 1) + 8 * v8) hasGreenTeaWithValue:a2]) {
          break;
        }
        if (v6 == ++v8)
        {
          uint64_t v6 = [v4 countByEnumeratingWithState:&v25 objects:v31 count:16];
          if (v6) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:

      -[GEOSnapScoreMetadata _readDestinationPoints]((uint64_t)v3);
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v4 = v3[4];
      uint64_t v9 = [v4 countByEnumeratingWithState:&v21 objects:v30 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v22;
LABEL_12:
        uint64_t v12 = 0;
        while (1)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v4);
          }
          if ([*(id *)(*((void *)&v21 + 1) + 8 * v12) hasGreenTeaWithValue:a2]) {
            break;
          }
          if (v10 == ++v12)
          {
            uint64_t v10 = [v4 countByEnumeratingWithState:&v21 objects:v30 count:16];
            if (v10) {
              goto LABEL_12;
            }
            goto LABEL_18;
          }
        }
      }
      else
      {
LABEL_18:

        -[GEOSnapScoreMetadata _readOriginAccessPoints]((uint64_t)v3);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        id v4 = v3[5];
        uint64_t v13 = [v4 countByEnumeratingWithState:&v17 objects:v29 count:16];
        if (!v13)
        {
LABEL_26:

          -[GEOSnapScoreMetadata _readOriginPoint]((uint64_t)v3);
          return [v3[6] hasGreenTeaWithValue:a2];
        }
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v18;
LABEL_20:
        uint64_t v16 = 0;
        while (1)
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(v4);
          }
          if (objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v16), "hasGreenTeaWithValue:", a2, (void)v17)) {
            break;
          }
          if (v14 == ++v16)
          {
            uint64_t v14 = [v4 countByEnumeratingWithState:&v17 objects:v29 count:16];
            if (v14) {
              goto LABEL_20;
            }
            goto LABEL_26;
          }
        }
      }
    }

    return 1;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
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
      GEOSnapScoreMetadataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOSnapScoreMetadata readAll:]((uint64_t)self, 0);
  id v8 = [(GEOSnapScorePoint *)self->_originPoint copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v8;

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v10 = self->_originAccessPoints;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v35;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v35 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = (void *)[*(id *)(*((void *)&v34 + 1) + 8 * v13) copyWithZone:a3];
        -[GEOSnapScoreMetadata addOriginAccessPoint:](v5, v14);

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v11);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v15 = self->_destinationPoints;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v31;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v31 != v17) {
          objc_enumerationMutation(v15);
        }
        long long v19 = (void *)[*(id *)(*((void *)&v30 + 1) + 8 * v18) copyWithZone:a3];
        -[GEOSnapScoreMetadata addDestinationPoint:](v5, v19);

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v16);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v20 = self->_destinationAccessPoints;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v27;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v27 != v22) {
          objc_enumerationMutation(v20);
        }
        long long v24 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * v23), "copyWithZone:", a3, (void)v26);
        -[GEOSnapScoreMetadata addDestinationAccessPoint:](v5, v24);

        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v26 objects:v38 count:16];
    }
    while (v21);
  }

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOSnapScoreMetadata readAll:]((uint64_t)self, 1),
         -[GEOSnapScoreMetadata readAll:]((uint64_t)v4, 1),
         originPoint = self->_originPoint,
         !((unint64_t)originPoint | v4[6]))
     || -[GEOSnapScorePoint isEqual:](originPoint, "isEqual:"))
    && ((originAccessPoints = self->_originAccessPoints, !((unint64_t)originAccessPoints | v4[5]))
     || -[NSMutableArray isEqual:](originAccessPoints, "isEqual:"))
    && ((destinationPoints = self->_destinationPoints, !((unint64_t)destinationPoints | v4[4]))
     || -[NSMutableArray isEqual:](destinationPoints, "isEqual:")))
  {
    destinationAccessPoints = self->_destinationAccessPoints;
    if ((unint64_t)destinationAccessPoints | v4[3]) {
      char v9 = -[NSMutableArray isEqual:](destinationAccessPoints, "isEqual:");
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
  -[GEOSnapScoreMetadata readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOSnapScorePoint *)self->_originPoint hash];
  uint64_t v4 = [(NSMutableArray *)self->_originAccessPoints hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_destinationPoints hash];
  return v4 ^ v5 ^ [(NSMutableArray *)self->_destinationAccessPoints hash];
}

- (void)mergeFrom:(uint64_t)a1
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    -[GEOSnapScoreMetadata readAll:]((uint64_t)v3, 0);
    uint64_t v5 = *(void **)(a1 + 48);
    id v6 = v4[6];
    if (v5)
    {
      if (v6) {
        objc_msgSend(v5, "mergeFrom:");
      }
    }
    else if (v6)
    {
      -[GEOSnapScoreMetadata setOriginPoint:](a1, v4[6]);
    }
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v7 = v4[5];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v31 != v10) {
            objc_enumerationMutation(v7);
          }
          -[GEOSnapScoreMetadata addOriginAccessPoint:](a1, *(void **)(*((void *)&v30 + 1) + 8 * i));
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v9);
    }

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v12 = v4[4];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v35 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v27;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v27 != v15) {
            objc_enumerationMutation(v12);
          }
          -[GEOSnapScoreMetadata addDestinationPoint:](a1, *(void **)(*((void *)&v26 + 1) + 8 * j));
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v35 count:16];
      }
      while (v14);
    }

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v17 = v4[3];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v22 objects:v34 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v23;
      do
      {
        for (uint64_t k = 0; k != v19; ++k)
        {
          if (*(void *)v23 != v20) {
            objc_enumerationMutation(v17);
          }
          -[GEOSnapScoreMetadata addDestinationAccessPoint:](a1, *(void **)(*((void *)&v22 + 1) + 8 * k));
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v22 objects:v34 count:16];
      }
      while (v19);
    }
  }
}

- (void)clearUnknownFields:(uint64_t)a1
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 68) |= 1u;
    *(unsigned char *)(a1 + 68) |= 0x20u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    uint64_t v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOSnapScoreMetadata readAll:](a1, 0);
      [*(id *)(a1 + 48) clearUnknownFields:1];
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v5 = *(id *)(a1 + 40);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v29;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v29 != v8) {
              objc_enumerationMutation(v5);
            }
            [*(id *)(*((void *)&v28 + 1) + 8 * v9++) clearUnknownFields:1];
          }
          while (v7 != v9);
          uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
        }
        while (v7);
      }

      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v10 = *(id *)(a1 + 32);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v25;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v25 != v13) {
              objc_enumerationMutation(v10);
            }
            [*(id *)(*((void *)&v24 + 1) + 8 * v14++) clearUnknownFields:1];
          }
          while (v12 != v14);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
        }
        while (v12);
      }

      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v15 = *(id *)(a1 + 24);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v21;
        do
        {
          uint64_t v19 = 0;
          do
          {
            if (*(void *)v21 != v18) {
              objc_enumerationMutation(v15);
            }
            objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v19++), "clearUnknownFields:", 1, (void)v20);
          }
          while (v17 != v19);
          uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
        }
        while (v17);
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originPoint, 0);
  objc_storeStrong((id *)&self->_originAccessPoints, 0);
  objc_storeStrong((id *)&self->_destinationPoints, 0);
  objc_storeStrong((id *)&self->_destinationAccessPoints, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end