@interface GEOPDTrail
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDTrail)init;
- (GEOPDTrail)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)entity;
- (id)factoid;
- (id)jsonRepresentation;
- (id)mapsIds;
- (id)photo;
- (unint64_t)hash;
- (void)_addNoFlagsHoursOfOperation:(uint64_t)a1;
- (void)_addNoFlagsMapsId:(uint64_t)a1;
- (void)_readEntity;
- (void)_readFactoid;
- (void)_readMapsIds;
- (void)_readPhoto;
- (void)addHoursOfOperation:(uint64_t)a1;
- (void)addMapsId:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDTrail

- (GEOPDTrail)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDTrail;
  v2 = [(GEOPDTrail *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDTrail)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDTrail;
  v3 = [(GEOPDTrail *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readEntity
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDTrailReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEntity_tags_9093);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)entity
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDTrail _readEntity]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readFactoid
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDTrailReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFactoid_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)factoid
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDTrail _readFactoid]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readMapsIds
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDTrailReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapsIds_tags_9094);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)mapsIds
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDTrail _readMapsIds]((uint64_t)a1);
    a1 = (id *)v2[7];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addMapsId:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDTrail _readMapsIds](a1);
    -[GEOPDTrail _addNoFlagsMapsId:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 88) |= 0x40u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    *(_WORD *)(a1 + 88) |= 0x100u;
  }
}

- (void)_addNoFlagsMapsId:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 56);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v5;

      v4 = *(void **)(a1 + 56);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readPhoto
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDTrailReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPhoto_tags_9095);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)photo
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDTrail _readPhoto]((uint64_t)a1);
    a1 = (id *)v2[8];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addHoursOfOperation:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x20) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDTrailReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readHoursOfOperations_tags_9096);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    -[GEOPDTrail _addNoFlagsHoursOfOperation:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 88) |= 0x20u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    *(_WORD *)(a1 + 88) |= 0x100u;
  }
}

- (void)_addNoFlagsHoursOfOperation:(uint64_t)a1
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

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDTrail;
  v4 = [(GEOPDTrail *)&v8 description];
  id v5 = [(GEOPDTrail *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDTrail _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDTrail readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = -[GEOPDTrail entity]((id *)a1);
    objc_super v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      id v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"entity"];
    }
    objc_super v8 = -[GEOPDTrail factoid]((id *)a1);
    v9 = v8;
    if (v8)
    {
      if (a2) {
        [v8 jsonRepresentation];
      }
      else {
      v10 = [v8 dictionaryRepresentation];
      }
      [v4 setObject:v10 forKey:@"factoid"];
    }
    if ([*(id *)(a1 + 56) count])
    {
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v12 = *(id *)(a1 + 56);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v51 objects:v56 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v52;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v52 != v14) {
              objc_enumerationMutation(v12);
            }
            v16 = *(void **)(*((void *)&v51 + 1) + 8 * i);
            if (a2) {
              [v16 jsonRepresentation];
            }
            else {
            v17 = [v16 dictionaryRepresentation];
            }
            [v11 addObject:v17];
          }
          uint64_t v13 = [v12 countByEnumeratingWithState:&v51 objects:v56 count:16];
        }
        while (v13);
      }

      if (a2) {
        v18 = @"mapsId";
      }
      else {
        v18 = @"maps_id";
      }
      [v4 setObject:v11 forKey:v18];
    }
    v19 = -[GEOPDTrail photo]((id *)a1);
    v20 = v19;
    if (v19)
    {
      if (a2) {
        [v19 jsonRepresentation];
      }
      else {
      v21 = [v19 dictionaryRepresentation];
      }
      [v4 setObject:v21 forKey:@"photo"];
    }
    if (*(_WORD *)(a1 + 88))
    {
      v22 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 84)];
      if (a2) {
        v23 = @"shouldHighlight";
      }
      else {
        v23 = @"should_highlight";
      }
      [v4 setObject:v22 forKey:v23];
    }
    if ([*(id *)(a1 + 48) count])
    {
      v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v25 = *(id *)(a1 + 48);
      uint64_t v26 = [v25 countByEnumeratingWithState:&v47 objects:v55 count:16];
      if (v26)
      {
        uint64_t v27 = *(void *)v48;
        do
        {
          for (uint64_t j = 0; j != v26; ++j)
          {
            if (*(void *)v48 != v27) {
              objc_enumerationMutation(v25);
            }
            v29 = *(void **)(*((void *)&v47 + 1) + 8 * j);
            if (a2) {
              [v29 jsonRepresentation];
            }
            else {
            v30 = [v29 dictionaryRepresentation];
            }
            [v24 addObject:v30];
          }
          uint64_t v26 = [v25 countByEnumeratingWithState:&v47 objects:v55 count:16];
        }
        while (v26);
      }

      if (a2) {
        v31 = @"hoursOfOperation";
      }
      else {
        v31 = @"hours_of_operation";
      }
      [v4 setObject:v24 forKey:v31];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 4) == 0)
    {
      v32 = *(void **)(a1 + 8);
      if (v32)
      {
        id v33 = v32;
        objc_sync_enter(v33);
        GEOPDTrailReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBusinessHours_tags_0);
        objc_sync_exit(v33);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    id v34 = *(id *)(a1 + 24);
    v35 = v34;
    if (v34)
    {
      if (a2)
      {
        v36 = [v34 jsonRepresentation];
        v37 = @"businessHours";
      }
      else
      {
        v36 = [v34 dictionaryRepresentation];
        v37 = @"business_hours";
      }
      [v4 setObject:v36 forKey:v37];
    }
    v38 = *(void **)(a1 + 16);
    if (v38)
    {
      v39 = [v38 dictionaryRepresentation];
      v40 = v39;
      if (a2)
      {
        v41 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v39, "count"));
        v45[0] = MEMORY[0x1E4F143A8];
        v45[1] = 3221225472;
        v45[2] = __40__GEOPDTrail__dictionaryRepresentation___block_invoke;
        v45[3] = &unk_1E53D8860;
        id v42 = v41;
        id v46 = v42;
        [v40 enumerateKeysAndObjectsUsingBlock:v45];
        id v43 = v42;
      }
      else
      {
        id v43 = v39;
      }
      [v4 setObject:v43 forKey:@"Unknown Fields"];
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
  return -[GEOPDTrail _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_9104;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_9105;
      }
      GEOPDTrailReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDTrailCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

void __40__GEOPDTrail__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDTrailReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader) {
    goto LABEL_7;
  }
  os_unfair_lock_assert_owner(&self->_readerLock);
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x100) != 0) {
    goto LABEL_7;
  }
  if ((flags & 8) != 0)
  {
    if (GEOPDEntityIsDirty((os_unfair_lock_s *)self->_entity)) {
      goto LABEL_7;
    }
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 0x50) == 0)
  {
    if ((flags & 0x80) != 0)
    {
      if (GEOPDPhotoIsDirty((uint64_t)self->_photo)) {
        goto LABEL_7;
      }
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 0x20) == 0)
    {
      if ((flags & 4) != 0)
      {
        businessHours = self->_businessHours;
        if (businessHours)
        {
          os_unfair_lock_lock_with_options();
          char IsDirty = _GEOPDBusinessHoursIsDirty((uint64_t)businessHours);
          os_unfair_lock_unlock(&businessHours->_readerLock);
          if (IsDirty) {
            goto LABEL_7;
          }
        }
        if ((*(_WORD *)&self->_flags & 0x20) != 0)
        {
          long long v33 = 0u;
          long long v34 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          obuint64_t j = self->_hoursOfOperations;
          uint64_t v17 = [(NSMutableArray *)obj countByEnumeratingWithState:&v31 objects:v37 count:16];
          if (v17)
          {
            uint64_t v18 = *(void *)v32;
            while (2)
            {
              for (uint64_t i = 0; i != v17; ++i)
              {
                if (*(void *)v32 != v18) {
                  objc_enumerationMutation(obj);
                }
                if (GEOPDHoursIsDirty(*(void *)(*((void *)&v31 + 1) + 8 * i)))
                {

                  goto LABEL_7;
                }
              }
              uint64_t v17 = [(NSMutableArray *)obj countByEnumeratingWithState:&v31 objects:v37 count:16];
              if (v17) {
                continue;
              }
              break;
            }
          }
        }
      }
      v20 = self->_reader;
      objc_sync_enter(v20);
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      v21 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
      [v4 writeData:v21];
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v20);
      goto LABEL_32;
    }
  }
LABEL_7:
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDTrail readAll:]((uint64_t)self, 0);
  if (self->_entity) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_factoid) {
    PBDataWriterWriteSubmessage();
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v7 = self->_mapsIds;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v8; ++j)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v27 objects:v36 count:16];
    }
    while (v8);
  }

  if (self->_photo) {
    PBDataWriterWriteSubmessage();
  }
  if (*(_WORD *)&self->_flags) {
    PBDataWriterWriteBOOLField();
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v11 = self->_hoursOfOperations;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v23 objects:v35 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v24;
    do
    {
      for (uint64_t k = 0; k != v12; ++k)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v23 objects:v35 count:16];
    }
    while (v12);
  }

  if (self->_businessHours) {
    PBDataWriterWriteSubmessage();
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
LABEL_32:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x100) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDTrailReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_22;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDTrail readAll:]((uint64_t)self, 0);
  id v9 = [(GEOPDEntity *)self->_entity copyWithZone:a3];
  id v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  id v11 = [(GEOPDTrailHeadTrailFactoidData *)self->_factoid copyWithZone:a3];
  uint64_t v12 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v11;

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v13 = self->_mapsIds;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v34 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = (void *)[*(id *)(*((void *)&v33 + 1) + 8 * i) copyWithZone:a3];
        -[GEOPDTrail addMapsId:](v5, v17);
      }
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v14);
  }

  id v18 = [(GEOPDPhoto *)self->_photo copyWithZone:a3];
  v19 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v18;

  if (*(_WORD *)&self->_flags)
  {
    *(unsigned char *)(v5 + 84) = self->_shouldHighlight;
    *(_WORD *)(v5 + 88) |= 1u;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v20 = self->_hoursOfOperations;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v30 != v22) {
          objc_enumerationMutation(v20);
        }
        long long v24 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * j), "copyWithZone:", a3, (void)v29);
        -[GEOPDTrail addHoursOfOperation:](v5, v24);
      }
      uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v21);
  }

  id v25 = [(GEOPDBusinessHours *)self->_businessHours copyWithZone:a3];
  long long v26 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v25;

  long long v27 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v27;
LABEL_22:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  -[GEOPDTrail readAll:]((uint64_t)self, 1);
  -[GEOPDTrail readAll:]((uint64_t)v4, 1);
  entity = self->_entity;
  if ((unint64_t)entity | *((void *)v4 + 4))
  {
    if (!-[GEOPDEntity isEqual:](entity, "isEqual:")) {
      goto LABEL_22;
    }
  }
  factoid = self->_factoid;
  if ((unint64_t)factoid | *((void *)v4 + 5))
  {
    if (!-[GEOPDTrailHeadTrailFactoidData isEqual:](factoid, "isEqual:")) {
      goto LABEL_22;
    }
  }
  mapsIds = self->_mapsIds;
  if ((unint64_t)mapsIds | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](mapsIds, "isEqual:")) {
      goto LABEL_22;
    }
  }
  photo = self->_photo;
  if ((unint64_t)photo | *((void *)v4 + 8))
  {
    if (!-[GEOPDPhoto isEqual:](photo, "isEqual:")) {
      goto LABEL_22;
    }
  }
  __int16 v9 = *((_WORD *)v4 + 44);
  if (*(_WORD *)&self->_flags)
  {
    if (v9)
    {
      if (self->_shouldHighlight)
      {
        if (!*((unsigned char *)v4 + 84)) {
          goto LABEL_22;
        }
        goto LABEL_18;
      }
      if (!*((unsigned char *)v4 + 84)) {
        goto LABEL_18;
      }
    }
LABEL_22:
    char v12 = 0;
    goto LABEL_23;
  }
  if (v9) {
    goto LABEL_22;
  }
LABEL_18:
  hoursOfOperations = self->_hoursOfOperations;
  if ((unint64_t)hoursOfOperations | *((void *)v4 + 6)
    && !-[NSMutableArray isEqual:](hoursOfOperations, "isEqual:"))
  {
    goto LABEL_22;
  }
  businessHours = self->_businessHours;
  if ((unint64_t)businessHours | *((void *)v4 + 3)) {
    char v12 = -[GEOPDBusinessHours isEqual:](businessHours, "isEqual:");
  }
  else {
    char v12 = 1;
  }
LABEL_23:

  return v12;
}

- (unint64_t)hash
{
  -[GEOPDTrail readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOPDEntity *)self->_entity hash];
  unint64_t v4 = [(GEOPDTrailHeadTrailFactoidData *)self->_factoid hash];
  uint64_t v5 = [(NSMutableArray *)self->_mapsIds hash];
  unint64_t v6 = [(GEOPDPhoto *)self->_photo hash];
  if (*(_WORD *)&self->_flags) {
    uint64_t v7 = 2654435761 * self->_shouldHighlight;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ [(NSMutableArray *)self->_hoursOfOperations hash];
  return v8 ^ [(GEOPDBusinessHours *)self->_businessHours hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photo, 0);
  objc_storeStrong((id *)&self->_mapsIds, 0);
  objc_storeStrong((id *)&self->_hoursOfOperations, 0);
  objc_storeStrong((id *)&self->_factoid, 0);
  objc_storeStrong((id *)&self->_entity, 0);
  objc_storeStrong((id *)&self->_businessHours, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end