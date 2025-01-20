@interface GEOPDTrailHead
+ (GEOPDTrailHead)trailHeadWithPlaceData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDTrailHead)init;
- (GEOPDTrailHead)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)trails;
- (uint64_t)hasGreenTeaWithValue:(uint64_t)a1;
- (uint64_t)hikingDisplayType;
- (unint64_t)hash;
- (void)_addNoFlagsMapsId:(uint64_t)a1;
- (void)_addNoFlagsTrail:(uint64_t)a1;
- (void)_readMapsIds;
- (void)_readTrails;
- (void)addMapsId:(uint64_t)a1;
- (void)addTrail:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDTrailHead

+ (GEOPDTrailHead)trailHeadWithPlaceData:(id)a3
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
  v6[2] = __58__GEOPDTrailHead_PlaceDataExtras__trailHeadWithPlaceData___block_invoke;
  v6[3] = &unk_1E53E16F0;
  v6[4] = &v7;
  [v3 enumerateValidComponentValuesOfType:98 usingBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (GEOPDTrailHead *)v4;
}

void __58__GEOPDTrailHead_PlaceDataExtras__trailHeadWithPlaceData___block_invoke(uint64_t a1, id *a2, unsigned char *a3)
{
  v5 = -[GEOPDComponentValue trailHead](a2);
  if (v5)
  {
    v6 = v5;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v5);
    v5 = v6;
    *a3 = 1;
  }
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)a1
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  -[GEOPDTrailHead _readMapsIds](a1);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v4 = *(id *)(a1 + 24);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v35 objects:v48 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v36;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v36 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v35 + 1) + 8 * i) hasGreenTeaWithValue:a2])
        {
LABEL_41:
          uint64_t v27 = 1;
          goto LABEL_42;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v35 objects:v48 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  -[GEOPDTrailHead _readTrails](a1);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v9 = [v4 countByEnumeratingWithState:&v31 objects:v47 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v32;
    v11 = &OBJC_IVAR___GEOPDGroundViewLabelInfo__flags;
    id v12 = &OBJC_IVAR___GEOPDGroundViewLabelInfo__flags;
    uint64_t v29 = *(void *)v32;
    do
    {
      uint64_t v30 = v9;
      for (uint64_t j = 0; j != v30; ++j)
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(v4);
        }
        uint64_t v14 = *(void *)(*((void *)&v31 + 1) + 8 * j);
        if (v14)
        {
          -[GEOPDTrail _readFactoid](*(void *)(*((void *)&v31 + 1) + 8 * j));
          uint64_t v15 = *(void *)(v14 + v11[466]);
          if (v15)
          {
            long long v45 = 0u;
            long long v46 = 0u;
            long long v43 = 0u;
            long long v44 = 0u;
            id v16 = *(id *)(v15 + v12[476]);
            uint64_t v17 = [v16 countByEnumeratingWithState:&v43 objects:v50 count:16];
            if (v17)
            {
              uint64_t v18 = v17;
              uint64_t v19 = *(void *)v44;
              while (2)
              {
                for (uint64_t k = 0; k != v18; ++k)
                {
                  if (*(void *)v44 != v19) {
                    objc_enumerationMutation(v16);
                  }
                  uint64_t v21 = *(void *)(*((void *)&v43 + 1) + 8 * k);
                  if (v21)
                  {
                    -[GEOPDFactoid _readPlaceId](*(void *)(*((void *)&v43 + 1) + 8 * k));
                    if ([*(id *)(v21 + 48) hasGreenTeaWithValue:a2])
                    {

                      goto LABEL_41;
                    }
                  }
                }
                uint64_t v18 = [v16 countByEnumeratingWithState:&v43 objects:v50 count:16];
                if (v18) {
                  continue;
                }
                break;
              }
            }
          }
          -[GEOPDTrail _readMapsIds](v14);
          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          id v22 = *(id *)(v14 + 56);
          uint64_t v23 = [v22 countByEnumeratingWithState:&v39 objects:v49 count:16];
          if (v23)
          {
            uint64_t v24 = v23;
            uint64_t v25 = *(void *)v40;
            while (2)
            {
              for (uint64_t m = 0; m != v24; ++m)
              {
                if (*(void *)v40 != v25) {
                  objc_enumerationMutation(v22);
                }
                if (objc_msgSend(*(id *)(*((void *)&v39 + 1) + 8 * m), "hasGreenTeaWithValue:", a2, v29))
                {

                  goto LABEL_41;
                }
              }
              uint64_t v24 = [v22 countByEnumeratingWithState:&v39 objects:v49 count:16];
              if (v24) {
                continue;
              }
              break;
            }
          }

          v11 = &OBJC_IVAR___GEOPDGroundViewLabelInfo__flags;
        }
        uint64_t v10 = v29;
        id v12 = &OBJC_IVAR___GEOPDGroundViewLabelInfo__flags;
      }
      uint64_t v9 = [v4 countByEnumeratingWithState:&v31 objects:v47 count:16];
    }
    while (v9);
  }
  uint64_t v27 = 0;
LABEL_42:

  return v27;
}

- (GEOPDTrailHead)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDTrailHead;
  v2 = [(GEOPDTrailHead *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (GEOPDTrailHead)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDTrailHead;
  id v3 = [(GEOPDTrailHead *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (void)_readTrails
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 60) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDTrailHeadReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTrails_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)trails
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDTrailHead _readTrails]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addTrail:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDTrailHead _readTrails](a1);
    -[GEOPDTrailHead _addNoFlagsTrail:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 60) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    *(unsigned char *)(a1 + 60) |= 0x20u;
  }
}

- (void)_addNoFlagsTrail:(uint64_t)a1
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

- (void)_readMapsIds
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
  if ((*(unsigned char *)(a1 + 60) & 8) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDTrailHeadReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapsIds_tags_9120);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
}

- (void)addMapsId:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDTrailHead _readMapsIds](a1);
    -[GEOPDTrailHead _addNoFlagsMapsId:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 60) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    *(unsigned char *)(a1 + 60) |= 0x20u;
  }
}

- (void)_addNoFlagsMapsId:(uint64_t)a1
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

- (uint64_t)hikingDisplayType
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    char v2 = *(unsigned char *)(v1 + 60);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 48));
    if (v2) {
      return *(unsigned int *)(v1 + 52);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDTrailHead;
  id v4 = [(GEOPDTrailHead *)&v8 description];
  id v5 = [(GEOPDTrailHead *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDTrailHead _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDTrailHead readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 32) count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v6 = *(id *)(a1 + 32);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v41 objects:v46 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v42 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v41 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            id v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v41 objects:v46 count:16];
        }
        while (v8);
      }

      [v4 setObject:v5 forKey:@"trail"];
    }
    if ([*(id *)(a1 + 24) count])
    {
      v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v14 = *(id *)(a1 + 24);
      uint64_t v15 = [v14 countByEnumeratingWithState:&v37 objects:v45 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v38;
        do
        {
          for (uint64_t j = 0; j != v16; ++j)
          {
            if (*(void *)v38 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = *(void **)(*((void *)&v37 + 1) + 8 * j);
            if (a2) {
              [v19 jsonRepresentation];
            }
            else {
            v20 = [v19 dictionaryRepresentation];
            }
            [v13 addObject:v20];
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v37 objects:v45 count:16];
        }
        while (v16);
      }

      if (a2) {
        uint64_t v21 = @"mapsId";
      }
      else {
        uint64_t v21 = @"maps_id";
      }
      [v4 setObject:v13 forKey:v21];
    }
    char v22 = *(unsigned char *)(a1 + 60);
    if (v22)
    {
      int v23 = *(_DWORD *)(a1 + 52);
      if (v23)
      {
        if (v23 == 1)
        {
          uint64_t v24 = @"HIKING_DISPLAY_TYPE_TRAIL";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 52));
          uint64_t v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        uint64_t v24 = @"HIKING_DISPLAY_TYPE_TRAIL_HEAD";
      }
      if (a2) {
        uint64_t v25 = @"hikingDisplayType";
      }
      else {
        uint64_t v25 = @"hiking_display_type";
      }
      [v4 setObject:v24 forKey:v25];

      char v22 = *(unsigned char *)(a1 + 60);
    }
    if ((v22 & 2) != 0)
    {
      v26 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 56)];
      if (a2) {
        uint64_t v27 = @"numInlineItems";
      }
      else {
        uint64_t v27 = @"num_inline_items";
      }
      [v4 setObject:v26 forKey:v27];
    }
    v28 = *(void **)(a1 + 16);
    if (v28)
    {
      uint64_t v29 = [v28 dictionaryRepresentation];
      uint64_t v30 = v29;
      if (a2)
      {
        long long v31 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v29, "count"));
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __44__GEOPDTrailHead__dictionaryRepresentation___block_invoke;
        v35[3] = &unk_1E53D8860;
        id v32 = v31;
        id v36 = v32;
        [v30 enumerateKeysAndObjectsUsingBlock:v35];
        id v33 = v32;

        uint64_t v30 = v33;
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
  return -[GEOPDTrailHead _dictionaryRepresentation:]((uint64_t)self, 1);
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
        id v6 = (int *)&readAll__recursiveTag_9130;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_9131;
      }
      GEOPDTrailHeadReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDTrailHeadCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

void __44__GEOPDTrailHead__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDTrailHeadReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x38) == 0))
  {
    uint64_t v15 = self->_reader;
    objc_sync_enter(v15);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v16 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v16];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v15);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDTrailHead readAll:]((uint64_t)self, 0);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v6 = self->_trails;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v7);
    }

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v10 = self->_mapsIds;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v18;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v11);
    }

    char flags = (char)self->_flags;
    if (flags)
    {
      PBDataWriterWriteInt32Field();
      char flags = (char)self->_flags;
    }
    if ((flags & 2) != 0) {
      PBDataWriterWriteUint32Field();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v17);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
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
      GEOPDTrailHeadReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_24;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDTrailHead readAll:]((uint64_t)self, 0);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v9 = self->_trails;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = (void *)[*(id *)(*((void *)&v26 + 1) + 8 * i) copyWithZone:a3];
        -[GEOPDTrailHead addTrail:](v5, v13);
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v10);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v14 = self->_mapsIds;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v14);
        }
        long long v18 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * j), "copyWithZone:", a3, (void)v22);
        -[GEOPDTrailHead addMapsId:](v5, v18);
      }
      uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v15);
  }

  char flags = (char)self->_flags;
  if (flags)
  {
    *(_DWORD *)(v5 + 52) = self->_hikingDisplayType;
    *(unsigned char *)(v5 + 60) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_numInlineItems;
    *(unsigned char *)(v5 + 60) |= 2u;
  }
  long long v20 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v20;
LABEL_24:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  -[GEOPDTrailHead readAll:]((uint64_t)self, 1);
  -[GEOPDTrailHead readAll:]((uint64_t)v4, 1);
  trails = self->_trails;
  if ((unint64_t)trails | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](trails, "isEqual:")) {
      goto LABEL_15;
    }
  }
  mapsIds = self->_mapsIds;
  if ((unint64_t)mapsIds | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](mapsIds, "isEqual:")) {
      goto LABEL_15;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_hikingDisplayType != *((_DWORD *)v4 + 13)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
LABEL_15:
    BOOL v7 = 0;
    goto LABEL_16;
  }
  BOOL v7 = (*((unsigned char *)v4 + 60) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0 || self->_numInlineItems != *((_DWORD *)v4 + 14)) {
      goto LABEL_15;
    }
    BOOL v7 = 1;
  }
LABEL_16:

  return v7;
}

- (unint64_t)hash
{
  -[GEOPDTrailHead readAll:]((uint64_t)self, 1);
  uint64_t v3 = [(NSMutableArray *)self->_trails hash];
  uint64_t v4 = [(NSMutableArray *)self->_mapsIds hash];
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v5 = 2654435761 * self->_hikingDisplayType;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_numInlineItems;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trails, 0);
  objc_storeStrong((id *)&self->_mapsIds, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end