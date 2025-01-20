@interface GEOCompanionWaypoint
+ (BOOL)isValid:(id)a3;
- (BOOL)hasFindMyHandleID;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasIsCurrentLocation;
- (BOOL)hasMapItem;
- (BOOL)hasRouteData;
- (BOOL)hasSearchString;
- (BOOL)hasWaypointTyped;
- (BOOL)isCurrentLocation;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOCompanionWaypoint)init;
- (GEOCompanionWaypoint)initWithComposedWaypoint:(id)a3;
- (GEOCompanionWaypoint)initWithData:(id)a3;
- (GEOCompanionWaypoint)initWithDictionary:(id)a3;
- (GEOCompanionWaypoint)initWithJSON:(id)a3;
- (GEOLocation)location;
- (GEOMapItemStorage)mapItem;
- (GEOWaypointTyped)waypointTyped;
- (NSData)routeData;
- (NSString)findMyHandleID;
- (NSString)searchString;
- (id)_dictionaryRepresentation:(unsigned __int8 *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readFindMyHandleID;
- (void)_readMapItem;
- (void)_readRouteData;
- (void)_readSearchString;
- (void)_readWaypointTyped;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setFindMyHandleID:(id)a3;
- (void)setHasIsCurrentLocation:(BOOL)a3;
- (void)setIsCurrentLocation:(BOOL)a3;
- (void)setMapItem:(id)a3;
- (void)setRouteData:(id)a3;
- (void)setSearchString:(id)a3;
- (void)setWaypointTyped:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOCompanionWaypoint

- (GEOCompanionWaypoint)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOCompanionWaypoint;
  v2 = [(GEOCompanionWaypoint *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOCompanionWaypoint)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOCompanionWaypoint;
  v3 = [(GEOCompanionWaypoint *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readMapItem
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionWaypointReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapItem_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasMapItem
{
  return self->_mapItem != 0;
}

- (GEOMapItemStorage)mapItem
{
  -[GEOCompanionWaypoint _readMapItem]((uint64_t)self);
  mapItem = self->_mapItem;

  return mapItem;
}

- (void)setMapItem:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x44u;
  objc_storeStrong((id *)&self->_mapItem, a3);
}

- (void)_readWaypointTyped
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionWaypointReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWaypointTyped_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasWaypointTyped
{
  return self->_waypointTyped != 0;
}

- (GEOWaypointTyped)waypointTyped
{
  -[GEOCompanionWaypoint _readWaypointTyped]((uint64_t)self);
  waypointTyped = self->_waypointTyped;

  return waypointTyped;
}

- (void)setWaypointTyped:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x60u;
  objc_storeStrong((id *)&self->_waypointTyped, a3);
}

- (BOOL)isCurrentLocation
{
  return self->_isCurrentLocation;
}

- (void)setIsCurrentLocation:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x41u;
  self->_isCurrentLocation = a3;
}

- (void)setHasIsCurrentLocation:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x40;
}

- (BOOL)hasIsCurrentLocation
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)_readSearchString
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionWaypointReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchString_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasSearchString
{
  return self->_searchString != 0;
}

- (NSString)searchString
{
  -[GEOCompanionWaypoint _readSearchString]((uint64_t)self);
  searchString = self->_searchString;

  return searchString;
}

- (void)setSearchString:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x50u;
  objc_storeStrong((id *)&self->_searchString, a3);
}

- (void)_readFindMyHandleID
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionWaypointReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFindMyHandleID_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasFindMyHandleID
{
  return self->_findMyHandleID != 0;
}

- (NSString)findMyHandleID
{
  -[GEOCompanionWaypoint _readFindMyHandleID]((uint64_t)self);
  findMyHandleID = self->_findMyHandleID;

  return findMyHandleID;
}

- (void)setFindMyHandleID:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x42u;
  objc_storeStrong((id *)&self->_findMyHandleID, a3);
}

- (void)_readRouteData
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionWaypointReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRouteData_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasRouteData
{
  return self->_routeData != 0;
}

- (NSData)routeData
{
  -[GEOCompanionWaypoint _readRouteData]((uint64_t)self);
  routeData = self->_routeData;

  return routeData;
}

- (void)setRouteData:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x48u;
  objc_storeStrong((id *)&self->_routeData, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOCompanionWaypoint;
  v4 = [(GEOCompanionWaypoint *)&v8 description];
  v5 = [(GEOCompanionWaypoint *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOCompanionWaypoint _dictionaryRepresentation:]((unsigned __int8 *)self, 0);
}

- (id)_dictionaryRepresentation:(unsigned __int8 *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 mapItem];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      objc_super v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"mapItem"];
    }
    objc_super v8 = [a1 waypointTyped];
    v9 = v8;
    if (v8)
    {
      if (a2) {
        [v8 jsonRepresentation];
      }
      else {
      v10 = [v8 dictionaryRepresentation];
      }
      [v4 setObject:v10 forKey:@"waypointTyped"];
    }
    if (a1[72])
    {
      v11 = [NSNumber numberWithBool:a1[68]];
      [v4 setObject:v11 forKey:@"isCurrentLocation"];
    }
    v12 = [a1 searchString];
    if (v12) {
      [v4 setObject:v12 forKey:@"searchString"];
    }

    v13 = [a1 findMyHandleID];
    if (v13) {
      [v4 setObject:v13 forKey:@"findMyHandleID"];
    }

    v14 = [a1 routeData];
    v15 = v14;
    if (v14)
    {
      if (a2)
      {
        v16 = [v14 base64EncodedStringWithOptions:0];
        [v4 setObject:v16 forKey:@"routeData"];
      }
      else
      {
        [v4 setObject:v14 forKey:@"routeData"];
      }
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
  return -[GEOCompanionWaypoint _dictionaryRepresentation:]((unsigned __int8 *)self, 1);
}

- (GEOCompanionWaypoint)initWithDictionary:(id)a3
{
  return (GEOCompanionWaypoint *)-[GEOCompanionWaypoint _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"mapItem"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v7 = [GEOMapItemStorage alloc];
        if (a3) {
          uint64_t v8 = [(GEOMapItemStorage *)v7 initWithJSON:v6];
        }
        else {
          uint64_t v8 = [(GEOMapItemStorage *)v7 initWithDictionary:v6];
        }
        v9 = (void *)v8;
        [a1 setMapItem:v8];
      }
      v10 = [v5 objectForKeyedSubscript:@"waypointTyped"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = [GEOWaypointTyped alloc];
        if (a3) {
          uint64_t v12 = [(GEOWaypointTyped *)v11 initWithJSON:v10];
        }
        else {
          uint64_t v12 = [(GEOWaypointTyped *)v11 initWithDictionary:v10];
        }
        v13 = (void *)v12;
        [a1 setWaypointTyped:v12];
      }
      v14 = [v5 objectForKeyedSubscript:@"isCurrentLocation"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIsCurrentLocation:", objc_msgSend(v14, "BOOLValue"));
      }

      v15 = [v5 objectForKeyedSubscript:@"searchString"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v16 = (void *)[v15 copy];
        [a1 setSearchString:v16];
      }
      v17 = [v5 objectForKeyedSubscript:@"findMyHandleID"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v18 = (void *)[v17 copy];
        [a1 setFindMyHandleID:v18];
      }
      v19 = [v5 objectForKeyedSubscript:@"routeData"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v20 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v19 options:0];
        [a1 setRouteData:v20];
      }
    }
  }

  return a1;
}

- (GEOCompanionWaypoint)initWithJSON:(id)a3
{
  return (GEOCompanionWaypoint *)-[GEOCompanionWaypoint _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      uint64_t v8 = (int *)&readAll__recursiveTag_1249;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_1250;
    }
    GEOCompanionWaypointReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEOMapItemStorage *)self->_mapItem readAll:1];
    [(GEOWaypointTyped *)self->_waypointTyped readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOCompanionWaypointIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOCompanionWaypointReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOCompanionWaypointIsDirty((uint64_t)self) & 1) == 0)
  {
    id v5 = self->_reader;
    objc_sync_enter(v5);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v6 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v7 writeData:v6];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v5);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOCompanionWaypoint *)self readAll:0];
    if (self->_mapItem) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_waypointTyped) {
      PBDataWriterWriteSubmessage();
    }
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_searchString) {
      PBDataWriterWriteStringField();
    }
    if (self->_findMyHandleID) {
      PBDataWriterWriteStringField();
    }
    if (self->_routeData) {
      PBDataWriterWriteDataField();
    }
  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOCompanionWaypoint _readMapItem]((uint64_t)self);
  if ([(GEOMapItemStorage *)self->_mapItem hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOCompanionWaypoint _readWaypointTyped]((uint64_t)self);
  waypointTyped = self->_waypointTyped;

  return [(GEOWaypointTyped *)waypointTyped hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEOCompanionWaypoint *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 14) = self->_readerMarkPos;
  *((_DWORD *)v5 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_mapItem) {
    objc_msgSend(v5, "setMapItem:");
  }
  if (self->_waypointTyped) {
    objc_msgSend(v5, "setWaypointTyped:");
  }
  v4 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *((unsigned char *)v5 + 68) = self->_isCurrentLocation;
    *((unsigned char *)v5 + 72) |= 1u;
  }
  if (self->_searchString)
  {
    objc_msgSend(v5, "setSearchString:");
    v4 = v5;
  }
  if (self->_findMyHandleID)
  {
    objc_msgSend(v5, "setFindMyHandleID:");
    v4 = v5;
  }
  if (self->_routeData)
  {
    objc_msgSend(v5, "setRouteData:");
    v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x40) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOCompanionWaypointReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOCompanionWaypoint *)self readAll:0];
  id v9 = [(GEOMapItemStorage *)self->_mapItem copyWithZone:a3];
  v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  id v11 = [(GEOWaypointTyped *)self->_waypointTyped copyWithZone:a3];
  uint64_t v12 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v11;

  if (*(unsigned char *)&self->_flags)
  {
    *(unsigned char *)(v5 + 68) = self->_isCurrentLocation;
    *(unsigned char *)(v5 + 72) |= 1u;
  }
  uint64_t v13 = [(NSString *)self->_searchString copyWithZone:a3];
  v14 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v13;

  uint64_t v15 = [(NSString *)self->_findMyHandleID copyWithZone:a3];
  v16 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v15;

  uint64_t v17 = [(NSData *)self->_routeData copyWithZone:a3];
  id v8 = *(id *)(v5 + 32);
  *(void *)(v5 + 32) = v17;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  [(GEOCompanionWaypoint *)self readAll:1];
  [v4 readAll:1];
  mapItem = self->_mapItem;
  if ((unint64_t)mapItem | *((void *)v4 + 3))
  {
    if (!-[GEOMapItemStorage isEqual:](mapItem, "isEqual:")) {
      goto LABEL_20;
    }
  }
  waypointTyped = self->_waypointTyped;
  if ((unint64_t)waypointTyped | *((void *)v4 + 6))
  {
    if (!-[GEOWaypointTyped isEqual:](waypointTyped, "isEqual:")) {
      goto LABEL_20;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if (*((unsigned char *)v4 + 72))
    {
      if (self->_isCurrentLocation)
      {
        if (!*((unsigned char *)v4 + 68)) {
          goto LABEL_20;
        }
        goto LABEL_14;
      }
      if (!*((unsigned char *)v4 + 68)) {
        goto LABEL_14;
      }
    }
LABEL_20:
    char v10 = 0;
    goto LABEL_21;
  }
  if (*((unsigned char *)v4 + 72)) {
    goto LABEL_20;
  }
LABEL_14:
  searchString = self->_searchString;
  if ((unint64_t)searchString | *((void *)v4 + 5)
    && !-[NSString isEqual:](searchString, "isEqual:"))
  {
    goto LABEL_20;
  }
  findMyHandleID = self->_findMyHandleID;
  if ((unint64_t)findMyHandleID | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](findMyHandleID, "isEqual:")) {
      goto LABEL_20;
    }
  }
  routeData = self->_routeData;
  if ((unint64_t)routeData | *((void *)v4 + 4)) {
    char v10 = -[NSData isEqual:](routeData, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_21:

  return v10;
}

- (unint64_t)hash
{
  [(GEOCompanionWaypoint *)self readAll:1];
  unint64_t v3 = [(GEOMapItemStorage *)self->_mapItem hash];
  unint64_t v4 = [(GEOWaypointTyped *)self->_waypointTyped hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v5 = 2654435761 * self->_isCurrentLocation;
  }
  else {
    uint64_t v5 = 0;
  }
  NSUInteger v6 = v4 ^ v3 ^ v5 ^ [(NSString *)self->_searchString hash];
  NSUInteger v7 = [(NSString *)self->_findMyHandleID hash];
  return v6 ^ v7 ^ [(NSData *)self->_routeData hash];
}

- (void)mergeFrom:(id)a3
{
  id v9 = a3;
  [v9 readAll:0];
  unint64_t v4 = v9;
  mapItem = self->_mapItem;
  uint64_t v6 = v9[3];
  if (mapItem)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEOMapItemStorage mergeFrom:](mapItem, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEOCompanionWaypoint setMapItem:](self, "setMapItem:");
  }
  unint64_t v4 = v9;
LABEL_7:
  waypointTyped = self->_waypointTyped;
  uint64_t v8 = v4[6];
  if (waypointTyped)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[GEOWaypointTyped mergeFrom:](waypointTyped, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[GEOCompanionWaypoint setWaypointTyped:](self, "setWaypointTyped:");
  }
  unint64_t v4 = v9;
LABEL_13:
  if (v4[9])
  {
    self->_isCurrentLocation = *((unsigned char *)v4 + 68);
    *(unsigned char *)&self->_flags |= 1u;
  }
  if (v4[5])
  {
    -[GEOCompanionWaypoint setSearchString:](self, "setSearchString:");
    unint64_t v4 = v9;
  }
  if (v4[2])
  {
    -[GEOCompanionWaypoint setFindMyHandleID:](self, "setFindMyHandleID:");
    unint64_t v4 = v9;
  }
  if (v4[4])
  {
    [(GEOCompanionWaypoint *)self setRouteData:"setRouteData:"];
    unint64_t v4 = v9;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waypointTyped, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_routeData, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_findMyHandleID, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOCompanionWaypoint)initWithComposedWaypoint:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)GEOCompanionWaypoint;
  uint64_t v5 = [(GEOCompanionWaypoint *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 mapItemStorage];
    [(GEOCompanionWaypoint *)v5 setMapItem:v6];

    NSUInteger v7 = [v4 geoWaypointTyped];
    [(GEOCompanionWaypoint *)v5 setWaypointTyped:v7];

    -[GEOCompanionWaypoint setIsCurrentLocation:](v5, "setIsCurrentLocation:", [v4 isCurrentLocation]);
    uint64_t v8 = [v4 route];
    id v9 = v8;
    if (v8)
    {
      char v10 = (void *)MEMORY[0x1E4F28DB0];
      id v11 = [v8 persistentData];
      id v16 = 0;
      uint64_t v12 = [v10 archivedDataWithRootObject:v11 requiringSecureCoding:1 error:&v16];
      id v13 = v16;
      [(GEOCompanionWaypoint *)v5 setRouteData:v12];

      if (v13)
      {
        v14 = GEOGetCompanionExtrasLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v19 = v13;
          _os_log_impl(&dword_188D96000, v14, OS_LOG_TYPE_ERROR, "Error encoding route data: %{public}@", buf, 0xCu);
        }
      }
    }
  }
  return v5;
}

- (GEOLocation)location
{
  unint64_t v3 = [(GEOCompanionWaypoint *)self mapItem];

  if (v3)
  {
    id v4 = [GEOLocation alloc];
    uint64_t v5 = [(GEOCompanionWaypoint *)self mapItem];
    [v5 coordinate];
    uint64_t v8 = -[GEOLocation initWithGEOCoordinate:isUserLocation:](v4, "initWithGEOCoordinate:isUserLocation:", [(GEOCompanionWaypoint *)self isCurrentLocation], v6, v7);
  }
  else
  {
    uint64_t v5 = [(GEOCompanionWaypoint *)self waypointTyped];
    id v9 = [v5 waypointLocation];
    uint64_t v8 = [v9 location];
  }

  return v8;
}

@end