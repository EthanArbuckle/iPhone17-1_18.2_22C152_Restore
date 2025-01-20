@interface GEOWaypoint
+ (BOOL)isValid:(id)a3;
+ (Class)entryPointType;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasLocation;
- (BOOL)hasPlaceSearchRequest;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLocation)location;
- (GEOPlaceSearchRequest)placeSearchRequest;
- (GEOWaypoint)init;
- (GEOWaypoint)initWithData:(id)a3;
- (GEOWaypoint)initWithDictionary:(id)a3;
- (GEOWaypoint)initWithJSON:(id)a3;
- (NSMutableArray)entryPoints;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)entryPointAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (unint64_t)entryPointsCount;
- (unint64_t)hash;
- (void)_addNoFlagsEntryPoint:(uint64_t)a1;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readEntryPoints;
- (void)_readLocation;
- (void)_readPlaceSearchRequest;
- (void)addEntryPoint:(id)a3;
- (void)clearEntryPoints;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setEntryPoints:(id)a3;
- (void)setLocation:(id)a3;
- (void)setPlaceSearchRequest:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOWaypoint

- (GEOWaypoint)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOWaypoint;
  v2 = [(GEOWaypoint *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOWaypoint)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOWaypoint;
  v3 = [(GEOWaypoint *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readPlaceSearchRequest
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceSearchRequest_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasPlaceSearchRequest
{
  return self->_placeSearchRequest != 0;
}

- (GEOPlaceSearchRequest)placeSearchRequest
{
  -[GEOWaypoint _readPlaceSearchRequest]((uint64_t)self);
  placeSearchRequest = self->_placeSearchRequest;

  return placeSearchRequest;
}

- (void)setPlaceSearchRequest:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_placeSearchRequest, a3);
}

- (void)_readLocation
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
        GEOWaypointReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocation_tags_3489);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (GEOLocation)location
{
  -[GEOWaypoint _readLocation]((uint64_t)self);
  location = self->_location;

  return location;
}

- (void)setLocation:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_location, a3);
}

- (void)_readEntryPoints
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
        GEOWaypointReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEntryPoints_tags_3490);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)entryPoints
{
  -[GEOWaypoint _readEntryPoints]((uint64_t)self);
  entryPoints = self->_entryPoints;

  return entryPoints;
}

- (void)setEntryPoints:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  entryPoints = self->_entryPoints;
  self->_entryPoints = v4;
}

- (void)clearEntryPoints
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  entryPoints = self->_entryPoints;

  [(NSMutableArray *)entryPoints removeAllObjects];
}

- (void)addEntryPoint:(id)a3
{
  id v4 = a3;
  -[GEOWaypoint _readEntryPoints]((uint64_t)self);
  -[GEOWaypoint _addNoFlagsEntryPoint:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsEntryPoint:(uint64_t)a1
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

- (unint64_t)entryPointsCount
{
  -[GEOWaypoint _readEntryPoints]((uint64_t)self);
  entryPoints = self->_entryPoints;

  return [(NSMutableArray *)entryPoints count];
}

- (id)entryPointAtIndex:(unint64_t)a3
{
  -[GEOWaypoint _readEntryPoints]((uint64_t)self);
  entryPoints = self->_entryPoints;

  return (id)[(NSMutableArray *)entryPoints objectAtIndex:a3];
}

+ (Class)entryPointType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOWaypoint;
  id v4 = [(GEOWaypoint *)&v8 description];
  id v5 = [(GEOWaypoint *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOWaypoint _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [(id)a1 placeSearchRequest];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      id v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"placeSearchRequest"];
    }
    objc_super v8 = [(id)a1 location];
    v9 = v8;
    if (v8)
    {
      if (a2) {
        [v8 jsonRepresentation];
      }
      else {
      v10 = [v8 dictionaryRepresentation];
      }
      [v4 setObject:v10 forKey:@"location"];
    }
    if ([*(id *)(a1 + 24) count])
    {
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v12 = *(id *)(a1 + 24);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v29 != v15) {
              objc_enumerationMutation(v12);
            }
            v17 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            if (a2) {
              [v17 jsonRepresentation];
            }
            else {
            v18 = [v17 dictionaryRepresentation];
            }
            [v11 addObject:v18];
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
        }
        while (v14);
      }

      [v4 setObject:v11 forKey:@"entryPoint"];
    }
    v19 = *(void **)(a1 + 16);
    if (v19)
    {
      v20 = [v19 dictionaryRepresentation];
      v21 = v20;
      if (a2)
      {
        v22 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v20, "count"));
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __41__GEOWaypoint__dictionaryRepresentation___block_invoke;
        v26[3] = &unk_1E53D8860;
        id v23 = v22;
        id v27 = v23;
        [v21 enumerateKeysAndObjectsUsingBlock:v26];
        id v24 = v23;

        v21 = v24;
      }
      [v4 setObject:v21 forKey:@"Unknown Fields"];
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
  return -[GEOWaypoint _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __41__GEOWaypoint__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOWaypoint)initWithDictionary:(id)a3
{
  return (GEOWaypoint *)-[GEOWaypoint _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"placeSearchRequest"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = [GEOPlaceSearchRequest alloc];
        if (a3) {
          uint64_t v8 = [(GEOPlaceSearchRequest *)v7 initWithJSON:v6];
        }
        else {
          uint64_t v8 = [(GEOPlaceSearchRequest *)v7 initWithDictionary:v6];
        }
        v9 = (void *)v8;
        [a1 setPlaceSearchRequest:v8];
      }
      id v10 = [v5 objectForKeyedSubscript:@"location"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = [GEOLocation alloc];
        if (a3) {
          uint64_t v12 = [(GEOLocation *)v11 initWithJSON:v10];
        }
        else {
          uint64_t v12 = [(GEOLocation *)v11 initWithDictionary:v10];
        }
        uint64_t v13 = (void *)v12;
        [a1 setLocation:v12];
      }
      uint64_t v14 = [v5 objectForKeyedSubscript:@"entryPoint"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v25 = v5;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v15 = v14;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v27;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v27 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v20 = *(void *)(*((void *)&v26 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v21 = [GEOLatLng alloc];
                if (a3) {
                  uint64_t v22 = [(GEOLatLng *)v21 initWithJSON:v20];
                }
                else {
                  uint64_t v22 = [(GEOLatLng *)v21 initWithDictionary:v20];
                }
                id v23 = (void *)v22;
                [a1 addEntryPoint:v22];
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
          }
          while (v17);
        }

        id v5 = v25;
      }
    }
  }

  return a1;
}

- (GEOWaypoint)initWithJSON:(id)a3
{
  return (GEOWaypoint *)-[GEOWaypoint _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      uint64_t v8 = (int *)&readAll__recursiveTag_3494;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_3495;
    }
    GEOWaypointReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOWaypointCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOWaypointIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOWaypointReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOWaypointIsDirty((uint64_t)self) & 1) == 0)
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
    [(GEOWaypoint *)self readAll:0];
    if (self->_placeSearchRequest) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_location) {
      PBDataWriterWriteSubmessage();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    objc_super v6 = self->_entryPoints;
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

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  -[GEOWaypoint _readEntryPoints]((uint64_t)self);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = self->_entryPoints;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9), "hasGreenTeaWithValue:", v3, (void)v11))
        {

          return 1;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  -[GEOWaypoint _readLocation]((uint64_t)self);
  if ([(GEOLocation *)self->_location hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOWaypoint _readPlaceSearchRequest]((uint64_t)self);
  return [(GEOPlaceSearchRequest *)self->_placeSearchRequest hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  uint64_t v8 = (id *)a3;
  [(GEOWaypoint *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 12) = self->_readerMarkPos;
  *((_DWORD *)v8 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_placeSearchRequest) {
    objc_msgSend(v8, "setPlaceSearchRequest:");
  }
  if (self->_location) {
    objc_msgSend(v8, "setLocation:");
  }
  if ([(GEOWaypoint *)self entryPointsCount])
  {
    [v8 clearEntryPoints];
    unint64_t v4 = [(GEOWaypoint *)self entryPointsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOWaypoint *)self entryPointAtIndex:i];
        [v8 addEntryPoint:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOWaypointReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOWaypoint *)self readAll:0];
  id v8 = [(GEOPlaceSearchRequest *)self->_placeSearchRequest copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  id v10 = [(GEOLocation *)self->_location copyWithZone:a3];
  long long v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v12 = self->_entryPoints;
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
        uint64_t v16 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v15), "copyWithZone:", a3, (void)v18);
        [(id)v5 addEntryPoint:v16];

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
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOWaypoint *)self readAll:1],
         [v4 readAll:1],
         placeSearchRequest = self->_placeSearchRequest,
         !((unint64_t)placeSearchRequest | v4[5]))
     || -[GEOPlaceSearchRequest isEqual:](placeSearchRequest, "isEqual:"))
    && ((location = self->_location, !((unint64_t)location | v4[4]))
     || -[GEOLocation isEqual:](location, "isEqual:")))
  {
    entryPoints = self->_entryPoints;
    if ((unint64_t)entryPoints | v4[3]) {
      char v8 = -[NSMutableArray isEqual:](entryPoints, "isEqual:");
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
  [(GEOWaypoint *)self readAll:1];
  unint64_t v3 = [(GEOPlaceSearchRequest *)self->_placeSearchRequest hash];
  unint64_t v4 = [(GEOLocation *)self->_location hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_entryPoints hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (id *)a3;
  [v4 readAll:0];
  placeSearchRequest = self->_placeSearchRequest;
  id v6 = v4[5];
  if (placeSearchRequest)
  {
    if (v6) {
      -[GEOPlaceSearchRequest mergeFrom:](placeSearchRequest, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[GEOWaypoint setPlaceSearchRequest:](self, "setPlaceSearchRequest:");
  }
  location = self->_location;
  id v8 = v4[4];
  if (location)
  {
    if (v8) {
      -[GEOLocation mergeFrom:](location, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[GEOWaypoint setLocation:](self, "setLocation:");
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = v4[3];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        -[GEOWaypoint addEntryPoint:](self, "addEntryPoint:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOWaypointReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_3499);
      objc_sync_exit(v5);
    }
  }
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;

  return unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x11u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOWaypoint *)self readAll:0];
    [(GEOPlaceSearchRequest *)self->_placeSearchRequest clearUnknownFields:1];
    [(GEOLocation *)self->_location clearUnknownFields:1];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v7 = self->_entryPoints;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "clearUnknownFields:", 1, (void)v12);
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeSearchRequest, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_entryPoints, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end