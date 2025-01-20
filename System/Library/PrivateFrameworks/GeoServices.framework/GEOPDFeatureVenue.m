@interface GEOPDFeatureVenue
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDFeatureVenue)init;
- (GEOPDFeatureVenue)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_addNoFlagsBuilding:(uint64_t)a1;
- (void)_addNoFlagsLevel:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDFeatureVenue

- (GEOPDFeatureVenue)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDFeatureVenue;
  v2 = [(GEOPDFeatureVenue *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDFeatureVenue)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDFeatureVenue;
  v3 = [(GEOPDFeatureVenue *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_addNoFlagsBuilding:(uint64_t)a1
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

- (void)_addNoFlagsLevel:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 32);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v5;

      v4 = *(void **)(a1 + 32);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDFeatureVenue;
  v4 = [(GEOPDFeatureVenue *)&v8 description];
  id v5 = [(GEOPDFeatureVenue *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDFeatureVenue _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDFeatureVenue readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 8) == 0)
    {
      id v5 = *(void **)(a1 + 8);
      if (v5)
      {
        id v6 = v5;
        objc_sync_enter(v6);
        GEOPDFeatureVenueReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readVenueContainer_tags_92);
        objc_sync_exit(v6);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    id v7 = *(id *)(a1 + 40);
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
    if ([*(id *)(a1 + 24) count])
    {
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v12 = *(id *)(a1 + 24);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v38 objects:v43 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v39;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v39 != v14) {
              objc_enumerationMutation(v12);
            }
            v16 = *(void **)(*((void *)&v38 + 1) + 8 * i);
            if (a2) {
              [v16 jsonRepresentation];
            }
            else {
            v17 = [v16 dictionaryRepresentation];
            }
            [v11 addObject:v17];
          }
          uint64_t v13 = [v12 countByEnumeratingWithState:&v38 objects:v43 count:16];
        }
        while (v13);
      }

      [v4 setObject:v11 forKey:@"building"];
    }
    if ([*(id *)(a1 + 32) count])
    {
      v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v19 = *(id *)(a1 + 32);
      uint64_t v20 = [v19 countByEnumeratingWithState:&v34 objects:v42 count:16];
      if (v20)
      {
        uint64_t v21 = *(void *)v35;
        do
        {
          for (uint64_t j = 0; j != v20; ++j)
          {
            if (*(void *)v35 != v21) {
              objc_enumerationMutation(v19);
            }
            v23 = *(void **)(*((void *)&v34 + 1) + 8 * j);
            if (a2) {
              [v23 jsonRepresentation];
            }
            else {
            v24 = [v23 dictionaryRepresentation];
            }
            [v18 addObject:v24];
          }
          uint64_t v20 = [v19 countByEnumeratingWithState:&v34 objects:v42 count:16];
        }
        while (v20);
      }

      [v4 setObject:v18 forKey:@"level"];
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
        v32[2] = __47__GEOPDFeatureVenue__dictionaryRepresentation___block_invoke;
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
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDFeatureVenue _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_94;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_95;
      }
      GEOPDFeatureVenueReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDFeatureVenueCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

void __47__GEOPDFeatureVenue__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDFeatureVenueReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDFeatureVenueIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v14 = self->_reader;
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
    -[GEOPDFeatureVenue readAll:]((uint64_t)self, 0);
    if (self->_venueContainer) {
      PBDataWriterWriteSubmessage();
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v6 = self->_buildings;
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
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v7);
    }

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v10 = self->_levels;
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

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v16);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v30 = 56;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v8 = self;
    v9 = reader;
    objc_sync_enter(v9);
    if ((*(unsigned char *)&v8->_flags & 0x10) == 0)
    {
      *(void *)((char *)v8->_reader + (int)*MEMORY[0x1E4F940E0]) = v8->_readerMarkLength;
      [(PBDataReader *)v8->_reader seekToOffset:v8->_readerMarkPos];
      GEOPDFeatureVenueReadAllFrom(v5, v8->_reader, 0);
      os_unfair_lock_unlock(p_readerLock);
      objc_sync_exit(v9);

      return (id)v5;
    }
    objc_sync_exit(v9);

    self = v8;
  }
  os_unfair_lock_unlock(p_readerLock);
  -[GEOPDFeatureVenue readAll:]((uint64_t)self, 0);
  id v10 = [(GEOPDVenueContainer *)self->_venueContainer copyWithZone:a3];
  uint64_t v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v31 = self;
  uint64_t v12 = self->_buildings;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v38;
    v15 = (os_unfair_lock_s *)(v5 + 56);
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v38 != v14) {
          objc_enumerationMutation(v12);
        }
        id v17 = (id)objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * i), "copyWithZone:", a3, v30);
        os_unfair_lock_lock(v15);
        if ((*(unsigned char *)(v5 + 60) & 2) == 0)
        {
          long long v18 = *(void **)(v5 + 8);
          if (v18)
          {
            id v19 = v18;
            objc_sync_enter(v19);
            GEOPDFeatureVenueReadSpecified(v5, *(void *)(v5 + 8), (int *)&_readBuildings_tags);
            objc_sync_exit(v19);
          }
        }
        os_unfair_lock_unlock(v15);
        -[GEOPDFeatureVenue _addNoFlagsBuilding:](v5, v17);

        os_unfair_lock_lock_with_options();
        *(unsigned char *)(v5 + 60) |= 2u;
        os_unfair_lock_unlock(v15);
        *(unsigned char *)(v5 + 60) |= 0x10u;
      }
      uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v13);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  obuint64_t j = v31->_levels;
  uint64_t v20 = [(NSMutableArray *)obj countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v34;
    long long v22 = (os_unfair_lock_s *)(v5 + v30);
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v34 != v21) {
          objc_enumerationMutation(obj);
        }
        v24 = (void *)[*(id *)(*((void *)&v33 + 1) + 8 * j) copyWithZone:a3];
        v25 = v24;
        if (v5)
        {
          id v26 = v24;
          os_unfair_lock_lock(v22);
          if ((*(unsigned char *)(v5 + 60) & 4) == 0)
          {
            v27 = *(void **)(v5 + 8);
            if (v27)
            {
              id v28 = v27;
              objc_sync_enter(v28);
              GEOPDFeatureVenueReadSpecified(v5, *(void *)(v5 + 8), (int *)&_readLevels_tags_93);
              objc_sync_exit(v28);
            }
          }
          os_unfair_lock_unlock(v22);
          -[GEOPDFeatureVenue _addNoFlagsLevel:](v5, v26);

          os_unfair_lock_lock_with_options();
          *(unsigned char *)(v5 + 60) |= 4u;
          os_unfair_lock_unlock(v22);
          *(unsigned char *)(v5 + 60) |= 0x10u;
        }
      }
      uint64_t v20 = [(NSMutableArray *)obj countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v20);
  }

  objc_storeStrong((id *)(v5 + 16), v31->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOPDFeatureVenue readAll:]((uint64_t)self, 1),
         -[GEOPDFeatureVenue readAll:]((uint64_t)v4, 1),
         venueContainer = self->_venueContainer,
         !((unint64_t)venueContainer | v4[5]))
     || -[GEOPDVenueContainer isEqual:](venueContainer, "isEqual:"))
    && ((buildings = self->_buildings, !((unint64_t)buildings | v4[3]))
     || -[NSMutableArray isEqual:](buildings, "isEqual:")))
  {
    levels = self->_levels;
    if ((unint64_t)levels | v4[4]) {
      char v8 = -[NSMutableArray isEqual:](levels, "isEqual:");
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
  -[GEOPDFeatureVenue readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOPDVenueContainer *)self->_venueContainer hash];
  uint64_t v4 = [(NSMutableArray *)self->_buildings hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_levels hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_venueContainer, 0);
  objc_storeStrong((id *)&self->_levels, 0);
  objc_storeStrong((id *)&self->_buildings, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end