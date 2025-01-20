@interface GEOPDLinkedService
+ (id)linkedServicesForPlaceData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDLinkedService)init;
- (GEOPDLinkedService)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)entity;
- (id)hours;
- (id)jsonRepresentation;
- (uint64_t)hasGreenTeaWithValue:(uint64_t)result;
- (unint64_t)hash;
- (void)_addNoFlagsHours:(uint64_t)a1;
- (void)_readEntity;
- (void)_readHours;
- (void)_readPlaceInfo;
- (void)addHours:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDLinkedService

+ (id)linkedServicesForPlaceData:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__37;
  v11 = __Block_byref_object_dispose__37;
  id v12 = (id)objc_opt_new();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__GEOPDLinkedService_PlaceDataExtras__linkedServicesForPlaceData___block_invoke;
  v6[3] = &unk_1E53E16F0;
  v6[4] = &v7;
  [v3 enumerateValidComponentValuesOfType:63 usingBlock:v6];
  v4 = (void *)[(id)v8[5] copy];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __66__GEOPDLinkedService_PlaceDataExtras__linkedServicesForPlaceData___block_invoke(uint64_t a1, id *a2, unsigned char *a3)
{
  v5 = -[GEOPDComponentValue linkedService](a2);
  if (v5)
  {
    v6 = v5;
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v5];
    v5 = v6;
  }
  else
  {
    *a3 = 1;
  }
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    -[GEOPDLinkedService _readPlaceInfo](result);
    uint64_t v4 = *(void *)(v3 + 40);
    return -[GEOPDPlaceInfo hasGreenTeaWithValue:](v4, a2);
  }
  return result;
}

- (GEOPDLinkedService)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDLinkedService;
  v2 = [(GEOPDLinkedService *)&v6 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = v2;
  }

  return v3;
}

- (GEOPDLinkedService)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDLinkedService;
  uint64_t v3 = [(GEOPDLinkedService *)&v7 initWithData:a3];
  uint64_t v4 = v3;
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDLinkedServiceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEntity_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)entity
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDLinkedService _readEntity]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readPlaceInfo
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
  if ((*(unsigned char *)(a1 + 60) & 8) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDLinkedServiceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceInfo_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
}

- (void)_readHours
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDLinkedServiceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readHours_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)hours
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDLinkedService _readHours]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addHours:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDLinkedService _readHours](a1);
    -[GEOPDLinkedService _addNoFlagsHours:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 60) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    *(unsigned char *)(a1 + 60) |= 0x10u;
  }
}

- (void)_addNoFlagsHours:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v5;

      uint64_t v4 = *(void **)(a1 + 32);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDLinkedService;
  uint64_t v4 = [(GEOPDLinkedService *)&v8 description];
  id v5 = [(GEOPDLinkedService *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDLinkedService _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDLinkedService readAll:](a1, 1);
    uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = -[GEOPDLinkedService entity]((id *)a1);
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
    -[GEOPDLinkedService _readPlaceInfo](a1);
    id v8 = *(id *)(a1 + 40);
    uint64_t v9 = v8;
    if (v8)
    {
      if (a2)
      {
        v10 = [v8 jsonRepresentation];
        v11 = @"placeInfo";
      }
      else
      {
        v10 = [v8 dictionaryRepresentation];
        v11 = @"place_info";
      }
      [v4 setObject:v10 forKey:v11];
    }
    if ([*(id *)(a1 + 32) count])
    {
      id v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v13 = *(id *)(a1 + 32);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v30 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            if (a2) {
              [v18 jsonRepresentation];
            }
            else {
            v19 = [v18 dictionaryRepresentation];
            }
            [v12 addObject:v19];
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
        }
        while (v15);
      }

      [v4 setObject:v12 forKey:@"hours"];
    }
    v20 = *(void **)(a1 + 16);
    if (v20)
    {
      v21 = [v20 dictionaryRepresentation];
      v22 = v21;
      if (a2)
      {
        v23 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v21, "count"));
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __48__GEOPDLinkedService__dictionaryRepresentation___block_invoke;
        v27[3] = &unk_1E53D8860;
        id v24 = v23;
        id v28 = v24;
        [v22 enumerateKeysAndObjectsUsingBlock:v27];
        id v25 = v24;

        v22 = v25;
      }
      [v4 setObject:v22 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDLinkedService _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    uint64_t v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_6116;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_6117;
      }
      GEOPDLinkedServiceReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDLinkedServiceCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

void __48__GEOPDLinkedService__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDLinkedServiceReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader) {
    goto LABEL_12;
  }
  os_unfair_lock_assert_owner(&self->_readerLock);
  char flags = (char)self->_flags;
  if ((flags & 0x10) != 0) {
    goto LABEL_12;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if (GEOPDEntityIsDirty((os_unfair_lock_s *)self->_entity)) {
      goto LABEL_12;
    }
    char flags = (char)self->_flags;
  }
  if ((flags & 8) != 0)
  {
    placeInfo = self->_placeInfo;
    if (placeInfo)
    {
      os_unfair_lock_lock_with_options();
      os_unfair_lock_assert_owner(&placeInfo->_readerLock);
      int v8 = *(_WORD *)&placeInfo->_flags & 0x3F0;
      os_unfair_lock_unlock(&placeInfo->_readerLock);
      if (v8) {
        goto LABEL_12;
      }
    }
    char flags = (char)self->_flags;
  }
  if ((flags & 4) == 0)
  {
    uint64_t v9 = self->_reader;
    objc_sync_enter(v9);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v10 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v10];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v9);
    goto LABEL_24;
  }
LABEL_12:
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDLinkedService readAll:]((uint64_t)self, 0);
  if (self->_entity) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_placeInfo) {
    PBDataWriterWriteSubmessage();
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v11 = self->_hours;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }

  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v15);
LABEL_24:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDLinkedServiceReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDLinkedService readAll:]((uint64_t)self, 0);
  id v8 = [(GEOPDEntity *)self->_entity copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  id v10 = [(GEOPDPlaceInfo *)self->_placeInfo copyWithZone:a3];
  v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v12 = self->_hours;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v19;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v12);
        }
        long long v16 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v15), "copyWithZone:", a3, (void)v18);
        -[GEOPDLinkedService addHours:](v5, v16);

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOPDLinkedService readAll:]((uint64_t)self, 1),
         -[GEOPDLinkedService readAll:]((uint64_t)v4, 1),
         entity = self->_entity,
         !((unint64_t)entity | v4[3]))
     || -[GEOPDEntity isEqual:](entity, "isEqual:"))
    && ((placeInfo = self->_placeInfo, !((unint64_t)placeInfo | v4[5]))
     || -[GEOPDPlaceInfo isEqual:](placeInfo, "isEqual:")))
  {
    hours = self->_hours;
    if ((unint64_t)hours | v4[4]) {
      char v8 = -[NSMutableArray isEqual:](hours, "isEqual:");
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
  -[GEOPDLinkedService readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOPDEntity *)self->_entity hash];
  unint64_t v4 = [(GEOPDPlaceInfo *)self->_placeInfo hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_hours hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeInfo, 0);
  objc_storeStrong((id *)&self->_hours, 0);
  objc_storeStrong((id *)&self->_entity, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end