@interface GEOPDFeaturePOI
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDFeaturePOI)init;
- (GEOPDFeaturePOI)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_addNoFlagsLevel:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDFeaturePOI

- (GEOPDFeaturePOI)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDFeaturePOI;
  v2 = [(GEOPDFeaturePOI *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDFeaturePOI)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDFeaturePOI;
  v3 = [(GEOPDFeaturePOI *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_addNoFlagsLevel:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 40);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v5;

      v4 = *(void **)(a1 + 40);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDFeaturePOI;
  v4 = [(GEOPDFeaturePOI *)&v8 description];
  id v5 = [(GEOPDFeaturePOI *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDFeaturePOI _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDFeaturePOI readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 0x10) == 0)
    {
      id v5 = *(void **)(a1 + 8);
      if (v5)
      {
        id v6 = v5;
        objc_sync_enter(v6);
        GEOPDFeaturePOIReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readVenueContainer_tags_67);
        objc_sync_exit(v6);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    id v7 = *(id *)(a1 + 48);
    objc_super v8 = v7;
    if (v7)
    {
      if (a2)
      {
        v9 = [v7 jsonRepresentation];
        v10 = @"venueContainer";
      }
      else
      {
        v9 = [v7 dictionaryRepresentation];
        v10 = @"venue_container";
      }
      [v4 setObject:v9 forKey:v10];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 2) == 0)
    {
      v11 = *(void **)(a1 + 8);
      if (v11)
      {
        id v12 = v11;
        objc_sync_enter(v12);
        GEOPDFeaturePOIReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBuilding_tags_68);
        objc_sync_exit(v12);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    id v13 = *(id *)(a1 + 24);
    v14 = v13;
    if (v13)
    {
      if (a2) {
        [v13 jsonRepresentation];
      }
      else {
      v15 = [v13 dictionaryRepresentation];
      }
      [v4 setObject:v15 forKey:@"building"];
    }
    if ([*(id *)(a1 + 40) count])
    {
      v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v17 = *(id *)(a1 + 40);
      uint64_t v18 = [v17 countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v39;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v39 != v19) {
              objc_enumerationMutation(v17);
            }
            v21 = *(void **)(*((void *)&v38 + 1) + 8 * i);
            if (a2) {
              [v21 jsonRepresentation];
            }
            else {
            v22 = [v21 dictionaryRepresentation];
            }
            [v16 addObject:v22];
          }
          uint64_t v18 = [v17 countByEnumeratingWithState:&v38 objects:v42 count:16];
        }
        while (v18);
      }

      [v4 setObject:v16 forKey:@"level"];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 4) == 0)
    {
      v23 = *(void **)(a1 + 8);
      if (v23)
      {
        id v24 = v23;
        objc_sync_enter(v24);
        GEOPDFeaturePOIReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDirectoryGroup_tags);
        objc_sync_exit(v24);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    id v25 = *(id *)(a1 + 32);
    v26 = v25;
    if (v25)
    {
      if (a2)
      {
        v27 = [v25 jsonRepresentation];
        v28 = @"directoryGroup";
      }
      else
      {
        v27 = [v25 dictionaryRepresentation];
        v28 = @"directory_group";
      }
      [v4 setObject:v27 forKey:v28];
    }
    v29 = *(void **)(a1 + 16);
    if (v29)
    {
      v30 = [v29 dictionaryRepresentation];
      v31 = v30;
      if (a2)
      {
        v32 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v30, "count"));
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __45__GEOPDFeaturePOI__dictionaryRepresentation___block_invoke;
        v36[3] = &unk_1E53D8860;
        id v33 = v32;
        id v37 = v33;
        [v31 enumerateKeysAndObjectsUsingBlock:v36];
        id v34 = v33;
      }
      else
      {
        id v34 = v30;
      }
      [v4 setObject:v34 forKey:@"Unknown Fields"];
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
  return -[GEOPDFeaturePOI _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_77;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_78;
      }
      GEOPDFeaturePOIReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDFeaturePOICallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __45__GEOPDFeaturePOI__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDFeaturePOIReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDFeaturePOIIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOPDFeaturePOI readAll:]((uint64_t)self, 0);
    if (self->_venueContainer) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_building) {
      PBDataWriterWriteSubmessage();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = self->_levels;
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

    if (self->_directoryGroup) {
      PBDataWriterWriteSubmessage();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
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
      GEOPDFeaturePOIReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDFeaturePOI readAll:]((uint64_t)self, 0);
  id v8 = [(GEOPDVenueContainer *)self->_venueContainer copyWithZone:a3];
  v9 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v8;

  id v10 = [(GEOPDVenueBuilding *)self->_building copyWithZone:a3];
  v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v22 = self;
  obj = self->_levels;
  uint64_t v12 = [(NSMutableArray *)obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v25;
    long long v14 = (os_unfair_lock_s *)(v5 + 64);
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(obj);
        }
        id v16 = (id)objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "copyWithZone:", a3, v22);
        os_unfair_lock_lock(v14);
        if ((*(unsigned char *)(v5 + 68) & 8) == 0)
        {
          uint64_t v17 = *(void **)(v5 + 8);
          if (v17)
          {
            id v18 = v17;
            objc_sync_enter(v18);
            GEOPDFeaturePOIReadSpecified(v5, *(void *)(v5 + 8), (int *)&_readLevels_tags_69);
            objc_sync_exit(v18);
          }
        }
        os_unfair_lock_unlock(v14);
        -[GEOPDFeaturePOI _addNoFlagsLevel:](v5, v16);

        os_unfair_lock_lock_with_options();
        *(unsigned char *)(v5 + 68) |= 8u;
        os_unfair_lock_unlock(v14);
        *(unsigned char *)(v5 + 68) |= 0x20u;
      }
      uint64_t v12 = [(NSMutableArray *)obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v12);
  }

  uint64_t v19 = [(GEOPDVenueDirectoryGroup *)v22->_directoryGroup copyWithZone:a3];
  v20 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v19;

  objc_storeStrong((id *)(v5 + 16), v22->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOPDFeaturePOI readAll:]((uint64_t)self, 1),
         -[GEOPDFeaturePOI readAll:]((uint64_t)v4, 1),
         venueContainer = self->_venueContainer,
         !((unint64_t)venueContainer | v4[6]))
     || -[GEOPDVenueContainer isEqual:](venueContainer, "isEqual:"))
    && ((building = self->_building, !((unint64_t)building | v4[3]))
     || -[GEOPDVenueBuilding isEqual:](building, "isEqual:"))
    && ((levels = self->_levels, !((unint64_t)levels | v4[5]))
     || -[NSMutableArray isEqual:](levels, "isEqual:")))
  {
    directoryGroup = self->_directoryGroup;
    if ((unint64_t)directoryGroup | v4[4]) {
      char v9 = -[GEOPDVenueDirectoryGroup isEqual:](directoryGroup, "isEqual:");
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
  -[GEOPDFeaturePOI readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOPDVenueContainer *)self->_venueContainer hash];
  unint64_t v4 = [(GEOPDVenueBuilding *)self->_building hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_levels hash];
  return v4 ^ v5 ^ [(GEOPDVenueDirectoryGroup *)self->_directoryGroup hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_venueContainer, 0);
  objc_storeStrong((id *)&self->_levels, 0);
  objc_storeStrong((id *)&self->_directoryGroup, 0);
  objc_storeStrong((id *)&self->_building, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end