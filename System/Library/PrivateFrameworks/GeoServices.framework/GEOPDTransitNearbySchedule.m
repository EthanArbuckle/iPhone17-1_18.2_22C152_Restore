@interface GEOPDTransitNearbySchedule
+ (id)transitNearbyScheduleForPlaceData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDTransitNearbySchedule)init;
- (GEOPDTransitNearbySchedule)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)categorys;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)groups;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_addNoFlagsCategory:(uint64_t)a1;
- (void)_addNoFlagsGroup:(uint64_t)a1;
- (void)_readCategorys;
- (void)_readGroups;
- (void)addCategory:(uint64_t)a1;
- (void)addGroup:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDTransitNearbySchedule

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        v6 = (int *)&readAll__recursiveTag_9426;
      }
      else {
        v6 = (int *)&readAll__nonRecursiveTag_9427;
      }
      GEOPDTransitNearbyScheduleReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDTransitNearbyScheduleCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

+ (id)transitNearbyScheduleForPlaceData:(id)a3
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
  v6[2] = __81__GEOPDTransitNearbySchedule_PlaceDataExtras__transitNearbyScheduleForPlaceData___block_invoke;
  v6[3] = &unk_1E53E16F0;
  v6[4] = &v7;
  [v3 enumerateValidComponentValuesOfType:79 usingBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __81__GEOPDTransitNearbySchedule_PlaceDataExtras__transitNearbyScheduleForPlaceData___block_invoke(uint64_t a1, id *a2, BOOL *a3)
{
  uint64_t v5 = -[GEOPDComponentValue transitNearbySchedule](a2);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  *a3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
}

- (GEOPDTransitNearbySchedule)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDTransitNearbySchedule;
  v2 = [(GEOPDTransitNearbySchedule *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (GEOPDTransitNearbySchedule)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDTransitNearbySchedule;
  id v3 = [(GEOPDTransitNearbySchedule *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (void)_readCategorys
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
        GEOPDTransitNearbyScheduleReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCategorys_tags_9420);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)categorys
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDTransitNearbySchedule _readCategorys]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addCategory:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDTransitNearbySchedule _readCategorys](a1);
    -[GEOPDTransitNearbySchedule _addNoFlagsCategory:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 52) |= 2u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    *(unsigned char *)(a1 + 52) |= 8u;
  }
}

- (void)_addNoFlagsCategory:(uint64_t)a1
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

- (void)_readGroups
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
        GEOPDTransitNearbyScheduleReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readGroups_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)groups
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDTransitNearbySchedule _readGroups]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addGroup:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDTransitNearbySchedule _readGroups](a1);
    -[GEOPDTransitNearbySchedule _addNoFlagsGroup:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 52) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    *(unsigned char *)(a1 + 52) |= 8u;
  }
}

- (void)_addNoFlagsGroup:(uint64_t)a1
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

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDTransitNearbySchedule;
  id v4 = [(GEOPDTransitNearbySchedule *)&v8 description];
  id v5 = [(GEOPDTransitNearbySchedule *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDTransitNearbySchedule _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDTransitNearbySchedule readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 24) count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v6 = *(id *)(a1 + 24);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v34 objects:v39 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v35 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            id v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v34 objects:v39 count:16];
        }
        while (v8);
      }

      [v4 setObject:v5 forKey:@"category"];
    }
    if ([*(id *)(a1 + 32) count])
    {
      v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v14 = *(id *)(a1 + 32);
      uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v38 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v31;
        do
        {
          for (uint64_t j = 0; j != v16; ++j)
          {
            if (*(void *)v31 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = *(void **)(*((void *)&v30 + 1) + 8 * j);
            if (a2) {
              [v19 jsonRepresentation];
            }
            else {
            v20 = [v19 dictionaryRepresentation];
            }
            [v13 addObject:v20];
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v30 objects:v38 count:16];
        }
        while (v16);
      }

      [v4 setObject:v13 forKey:@"group"];
    }
    v21 = *(void **)(a1 + 16);
    if (v21)
    {
      v22 = [v21 dictionaryRepresentation];
      v23 = v22;
      if (a2)
      {
        v24 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v22, "count"));
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __56__GEOPDTransitNearbySchedule__dictionaryRepresentation___block_invoke;
        v28[3] = &unk_1E53D8860;
        id v25 = v24;
        id v29 = v25;
        [v23 enumerateKeysAndObjectsUsingBlock:v28];
        id v26 = v25;

        v23 = v26;
      }
      [v4 setObject:v23 forKey:@"Unknown Fields"];
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
  return -[GEOPDTransitNearbySchedule _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __56__GEOPDTransitNearbySchedule__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDTransitNearbyScheduleReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  uint64_t v6 = 8;
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0xE) == 0))
  {
    if ((*(unsigned char *)&self->_flags & 4) != 0)
    {
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      obuint64_t j = self->_groups;
      uint64_t v15 = [(NSMutableArray *)obj countByEnumeratingWithState:&v33 objects:v39 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v34;
        while (2)
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v34 != v16) {
              objc_enumerationMutation(obj);
            }
            v18 = p_readerLock;
            uint64_t v19 = v6;
            uint64_t v20 = *(void *)(*((void *)&v33 + 1) + 8 * i);
            if (v20)
            {
              os_unfair_lock_lock_with_options();
              os_unfair_lock_assert_owner((const os_unfair_lock *)(v20 + 120));
              int v21 = *(_WORD *)(v20 + 144) & 0xFC0;
              os_unfair_lock_unlock((os_unfair_lock_t)(v20 + 120));
              if (v21)
              {

                p_readerLocuint64_t k = v18;
                goto LABEL_3;
              }
            }
            uint64_t v6 = v19;
            p_readerLocuint64_t k = v18;
          }
          uint64_t v15 = [(NSMutableArray *)obj countByEnumeratingWithState:&v33 objects:v39 count:16];
          if (v15) {
            continue;
          }
          break;
        }
      }
    }
    id v22 = *(id *)((char *)&self->super.super.isa + v6);
    objc_sync_enter(v22);
    *(void *)(*(char **)((char *)&self->super.super.isa + v6) + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [*(id *)((char *)&self->super.super.isa + v6) seekToOffset:self->_readerMarkPos];
    v23 = [*(id *)((char *)&self->super.super.isa + v6) readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v23];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v22);
  }
  else
  {
LABEL_3:
    os_unfair_lock_unlock(p_readerLock);
    -[GEOPDTransitNearbySchedule readAll:]((uint64_t)self, 0);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v7 = self->_categorys;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v29 objects:v38 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v8; ++j)
        {
          if (*(void *)v30 != v9) {
            objc_enumerationMutation(v7);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v29 objects:v38 count:16];
      }
      while (v8);
    }

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v11 = self->_groups;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v25 objects:v37 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v26;
      do
      {
        for (uint64_t k = 0; k != v12; ++k)
        {
          if (*(void *)v26 != v13) {
            objc_enumerationMutation(v11);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v25 objects:v37 count:16];
      }
      while (v12);
    }

    [(PBUnknownFields *)self->_unknownFields writeTo:v4];
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
      GEOPDTransitNearbyScheduleReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDTransitNearbySchedule readAll:]((uint64_t)self, 0);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v8 = self->_categorys;
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
        -[GEOPDTransitNearbySchedule addCategory:]((uint64_t)v5, v12);

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
  uint64_t v13 = self->_groups;
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
        uint64_t v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v16), "copyWithZone:", a3, (void)v19);
        -[GEOPDTransitNearbySchedule addGroup:]((uint64_t)v5, v17);

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
    && ((-[GEOPDTransitNearbySchedule readAll:]((uint64_t)self, 1),
         -[GEOPDTransitNearbySchedule readAll:]((uint64_t)v4, 1),
         categorys = self->_categorys,
         !((unint64_t)categorys | v4[3]))
     || -[NSMutableArray isEqual:](categorys, "isEqual:")))
  {
    groups = self->_groups;
    if ((unint64_t)groups | v4[4]) {
      char v7 = -[NSMutableArray isEqual:](groups, "isEqual:");
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
  -[GEOPDTransitNearbySchedule readAll:]((uint64_t)self, 1);
  uint64_t v3 = [(NSMutableArray *)self->_categorys hash];
  return [(NSMutableArray *)self->_groups hash] ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groups, 0);
  objc_storeStrong((id *)&self->_categorys, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end