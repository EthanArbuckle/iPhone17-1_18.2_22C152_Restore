@interface GEOWaypointPlace
+ (BOOL)isValid:(id)a3;
+ (Class)roadAccessPointType;
- (BOOL)hasCenter;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasMapRegion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLatLng)center;
- (GEOMapRegion)mapRegion;
- (GEOWaypointPlace)init;
- (GEOWaypointPlace)initWithData:(id)a3;
- (GEOWaypointPlace)initWithDictionary:(id)a3;
- (GEOWaypointPlace)initWithJSON:(id)a3;
- (NSMutableArray)roadAccessPoints;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)roadAccessPointAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)roadAccessPointsCount;
- (void)_addNoFlagsRoadAccessPoint:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readCenter;
- (void)_readMapRegion;
- (void)_readRoadAccessPoints;
- (void)addRoadAccessPoint:(id)a3;
- (void)clearRoadAccessPoints;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setCenter:(id)a3;
- (void)setMapRegion:(id)a3;
- (void)setRoadAccessPoints:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOWaypointPlace

- (void)setRoadAccessPoints:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  roadAccessPoints = self->_roadAccessPoints;
  self->_roadAccessPoints = v4;
}

- (void)setMapRegion:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_mapRegion, a3);
}

- (void)setCenter:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x12u;
  objc_storeStrong((id *)&self->_center, a3);
}

- (GEOWaypointPlace)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOWaypointPlace;
  v2 = [(GEOWaypointPlace *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roadAccessPoints, 0);
  objc_storeStrong((id *)&self->_mapRegion, 0);
  objc_storeStrong((id *)&self->_center, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1E) == 0))
  {
    v10 = self->_reader;
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
    [(GEOWaypointPlace *)self readAll:0];
    if (self->_center) {
      PBDataWriterWriteSubmessage();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    objc_super v6 = self->_roadAccessPoints;
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

    if (self->_mapRegion) {
      PBDataWriterWriteSubmessage();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
  }
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      uint64_t v8 = (int *)&readAll__recursiveTag_3703;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_3704;
    }
    GEOWaypointPlaceReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOWaypointPlaceCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

- (GEOWaypointPlace)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOWaypointPlace;
  BOOL v3 = [(GEOWaypointPlace *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readCenter
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
        GEOWaypointPlaceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCenter_tags_3691);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasCenter
{
  return self->_center != 0;
}

- (GEOLatLng)center
{
  -[GEOWaypointPlace _readCenter]((uint64_t)self);
  center = self->_center;

  return center;
}

- (void)_readRoadAccessPoints
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
        GEOWaypointPlaceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRoadAccessPoints_tags_3692);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)roadAccessPoints
{
  -[GEOWaypointPlace _readRoadAccessPoints]((uint64_t)self);
  roadAccessPoints = self->_roadAccessPoints;

  return roadAccessPoints;
}

- (void)clearRoadAccessPoints
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  roadAccessPoints = self->_roadAccessPoints;

  [(NSMutableArray *)roadAccessPoints removeAllObjects];
}

- (void)addRoadAccessPoint:(id)a3
{
  id v4 = a3;
  -[GEOWaypointPlace _readRoadAccessPoints]((uint64_t)self);
  -[GEOWaypointPlace _addNoFlagsRoadAccessPoint:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsRoadAccessPoint:(uint64_t)a1
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

- (unint64_t)roadAccessPointsCount
{
  -[GEOWaypointPlace _readRoadAccessPoints]((uint64_t)self);
  roadAccessPoints = self->_roadAccessPoints;

  return [(NSMutableArray *)roadAccessPoints count];
}

- (id)roadAccessPointAtIndex:(unint64_t)a3
{
  -[GEOWaypointPlace _readRoadAccessPoints]((uint64_t)self);
  roadAccessPoints = self->_roadAccessPoints;

  return (id)[(NSMutableArray *)roadAccessPoints objectAtIndex:a3];
}

+ (Class)roadAccessPointType
{
  return (Class)objc_opt_class();
}

- (void)_readMapRegion
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
        GEOWaypointPlaceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapRegion_tags_3693);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasMapRegion
{
  return self->_mapRegion != 0;
}

- (GEOMapRegion)mapRegion
{
  -[GEOWaypointPlace _readMapRegion]((uint64_t)self);
  mapRegion = self->_mapRegion;

  return mapRegion;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOWaypointPlace;
  id v4 = [(GEOWaypointPlace *)&v8 description];
  id v5 = [(GEOWaypointPlace *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOWaypointPlace _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [(id)a1 center];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      id v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"center"];
    }
    if ([*(id *)(a1 + 40) count])
    {
      objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v9 = *(id *)(a1 + 40);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v31 != v12) {
              objc_enumerationMutation(v9);
            }
            long long v14 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            if (a2) {
              [v14 jsonRepresentation];
            }
            else {
            long long v15 = [v14 dictionaryRepresentation];
            }
            [v8 addObject:v15];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v30 objects:v34 count:16];
        }
        while (v11);
      }

      if (a2) {
        v16 = @"roadAccessPoint";
      }
      else {
        v16 = @"road_access_point";
      }
      [v4 setObject:v8 forKey:v16];
    }
    uint64_t v17 = [(id)a1 mapRegion];
    v18 = v17;
    if (v17)
    {
      if (a2)
      {
        v19 = [v17 jsonRepresentation];
        v20 = @"mapRegion";
      }
      else
      {
        v19 = [v17 dictionaryRepresentation];
        v20 = @"map_region";
      }
      [v4 setObject:v19 forKey:v20];
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
        v28[2] = __46__GEOWaypointPlace__dictionaryRepresentation___block_invoke;
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
  return -[GEOWaypointPlace _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __46__GEOWaypointPlace__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    id v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOWaypointPlace)initWithDictionary:(id)a3
{
  return (GEOWaypointPlace *)-[GEOWaypointPlace _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"center"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = [GEOLatLng alloc];
        if (a3) {
          uint64_t v8 = [(GEOLatLng *)v7 initWithJSON:v6];
        }
        else {
          uint64_t v8 = [(GEOLatLng *)v7 initWithDictionary:v6];
        }
        id v9 = (void *)v8;
        [a1 setCenter:v8];
      }
      if (a3) {
        id v10 = @"roadAccessPoint";
      }
      else {
        id v10 = @"road_access_point";
      }
      uint64_t v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v27 = v5;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v12 = v11;
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
              uint64_t v17 = *(void *)(*((void *)&v28 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v18 = [GEORoadAccessPoint alloc];
                if (a3) {
                  uint64_t v19 = [(GEORoadAccessPoint *)v18 initWithJSON:v17];
                }
                else {
                  uint64_t v19 = [(GEORoadAccessPoint *)v18 initWithDictionary:v17];
                }
                v20 = (void *)v19;
                [a1 addRoadAccessPoint:v19];
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
          }
          while (v14);
        }

        id v5 = v27;
      }

      if (a3) {
        v21 = @"mapRegion";
      }
      else {
        v21 = @"map_region";
      }
      v22 = [v5 objectForKeyedSubscript:v21];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v23 = [GEOMapRegion alloc];
        if (a3) {
          uint64_t v24 = [(GEOMapRegion *)v23 initWithJSON:v22];
        }
        else {
          uint64_t v24 = [(GEOMapRegion *)v23 initWithDictionary:v22];
        }
        id v25 = (void *)v24;
        [a1 setMapRegion:v24];
      }
    }
  }

  return a1;
}

- (GEOWaypointPlace)initWithJSON:(id)a3
{
  return (GEOWaypointPlace *)-[GEOWaypointPlace _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOWaypointPlaceIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOWaypointPlaceReadAllFrom((uint64_t)self, a3, 0);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  -[GEOWaypointPlace _readCenter]((uint64_t)self);
  if ([(GEOLatLng *)self->_center hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOWaypointPlace _readMapRegion]((uint64_t)self);
  if ([(GEOMapRegion *)self->_mapRegion hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOWaypointPlace _readRoadAccessPoints]((uint64_t)self);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  objc_super v6 = self->_roadAccessPoints;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        if (objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "hasGreenTeaWithValue:", v3, (void)v12))
        {
          BOOL v5 = 1;
          goto LABEL_14;
        }
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v5 = 0;
LABEL_14:

  return v5;
}

- (void)copyTo:(id)a3
{
  uint64_t v8 = (id *)a3;
  [(GEOWaypointPlace *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 12) = self->_readerMarkPos;
  *((_DWORD *)v8 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_center) {
    objc_msgSend(v8, "setCenter:");
  }
  if ([(GEOWaypointPlace *)self roadAccessPointsCount])
  {
    [v8 clearRoadAccessPoints];
    unint64_t v4 = [(GEOWaypointPlace *)self roadAccessPointsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOWaypointPlace *)self roadAccessPointAtIndex:i];
        [v8 addRoadAccessPoint:v7];
      }
    }
  }
  if (self->_mapRegion) {
    objc_msgSend(v8, "setMapRegion:");
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
      GEOWaypointPlaceReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOWaypointPlace *)self readAll:0];
  id v8 = [(GEOLatLng *)self->_center copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = self->_roadAccessPoints;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v19;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v10);
        }
        long long v14 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v13), "copyWithZone:", a3, (void)v18);
        [(id)v5 addRoadAccessPoint:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  id v15 = [(GEOMapRegion *)self->_mapRegion copyWithZone:a3];
  v16 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v15;

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOWaypointPlace *)self readAll:1],
         [v4 readAll:1],
         center = self->_center,
         !((unint64_t)center | v4[3]))
     || -[GEOLatLng isEqual:](center, "isEqual:"))
    && ((roadAccessPoints = self->_roadAccessPoints, !((unint64_t)roadAccessPoints | v4[5]))
     || -[NSMutableArray isEqual:](roadAccessPoints, "isEqual:")))
  {
    mapRegion = self->_mapRegion;
    if ((unint64_t)mapRegion | v4[4]) {
      char v8 = -[GEOMapRegion isEqual:](mapRegion, "isEqual:");
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
  [(GEOWaypointPlace *)self readAll:1];
  unint64_t v3 = [(GEOLatLng *)self->_center hash];
  uint64_t v4 = [(NSMutableArray *)self->_roadAccessPoints hash] ^ v3;
  return v4 ^ [(GEOMapRegion *)self->_mapRegion hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (id *)a3;
  [v4 readAll:0];
  center = self->_center;
  id v6 = v4[3];
  if (center)
  {
    if (v6) {
      -[GEOLatLng mergeFrom:](center, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[GEOWaypointPlace setCenter:](self, "setCenter:");
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v4[5];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        -[GEOWaypointPlace addRoadAccessPoint:](self, "addRoadAccessPoint:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  mapRegion = self->_mapRegion;
  id v13 = v4[4];
  if (mapRegion)
  {
    if (v13) {
      -[GEOMapRegion mergeFrom:](mapRegion, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[GEOWaypointPlace setMapRegion:](self, "setMapRegion:");
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
      GEOWaypointPlaceReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_3708);
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
    [(GEOWaypointPlace *)self readAll:0];
    [(GEOLatLng *)self->_center clearUnknownFields:1];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = self->_roadAccessPoints;
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

    [(GEOMapRegion *)self->_mapRegion clearUnknownFields:1];
  }
}

@end