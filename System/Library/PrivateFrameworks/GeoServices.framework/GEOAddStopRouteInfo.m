@interface GEOAddStopRouteInfo
+ (BOOL)isValid:(id)a3;
- (BOOL)hasOriginalWaypointRouteRepresentation;
- (BOOL)hasRouteAttributes;
- (BOOL)hasRouteId;
- (BOOL)hasSessionState;
- (BOOL)hasZilchData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOAddStopRouteInfo)init;
- (GEOAddStopRouteInfo)initWithData:(id)a3;
- (GEOAddStopRouteInfo)initWithDictionary:(id)a3;
- (GEOAddStopRouteInfo)initWithJSON:(id)a3;
- (GEORouteAttributes)routeAttributes;
- (NSData)originalWaypointRouteRepresentation;
- (NSData)routeId;
- (NSData)sessionState;
- (NSData)zilchData;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readOriginalWaypointRouteRepresentation;
- (void)_readRouteAttributes;
- (void)_readRouteId;
- (void)_readSessionState;
- (void)_readZilchData;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setOriginalWaypointRouteRepresentation:(id)a3;
- (void)setRouteAttributes:(id)a3;
- (void)setRouteId:(id)a3;
- (void)setSessionState:(id)a3;
- (void)setZilchData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOAddStopRouteInfo

- (GEOAddStopRouteInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOAddStopRouteInfo;
  v2 = [(GEOAddStopRouteInfo *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOAddStopRouteInfo)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOAddStopRouteInfo;
  v3 = [(GEOAddStopRouteInfo *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readOriginalWaypointRouteRepresentation
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOAddStopRouteInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOriginalWaypointRouteRepresentation_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasOriginalWaypointRouteRepresentation
{
  return self->_originalWaypointRouteRepresentation != 0;
}

- (NSData)originalWaypointRouteRepresentation
{
  -[GEOAddStopRouteInfo _readOriginalWaypointRouteRepresentation]((uint64_t)self);
  originalWaypointRouteRepresentation = self->_originalWaypointRouteRepresentation;

  return originalWaypointRouteRepresentation;
}

- (void)setOriginalWaypointRouteRepresentation:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x42u;
  objc_storeStrong((id *)&self->_originalWaypointRouteRepresentation, a3);
}

- (void)_readZilchData
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOAddStopRouteInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readZilchData_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasZilchData
{
  return self->_zilchData != 0;
}

- (NSData)zilchData
{
  -[GEOAddStopRouteInfo _readZilchData]((uint64_t)self);
  zilchData = self->_zilchData;

  return zilchData;
}

- (void)setZilchData:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x60u;
  objc_storeStrong((id *)&self->_zilchData, a3);
}

- (void)_readSessionState
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOAddStopRouteInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSessionState_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasSessionState
{
  return self->_sessionState != 0;
}

- (NSData)sessionState
{
  -[GEOAddStopRouteInfo _readSessionState]((uint64_t)self);
  sessionState = self->_sessionState;

  return sessionState;
}

- (void)setSessionState:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x50u;
  objc_storeStrong((id *)&self->_sessionState, a3);
}

- (void)_readRouteId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOAddStopRouteInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRouteId_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasRouteId
{
  return self->_routeId != 0;
}

- (NSData)routeId
{
  -[GEOAddStopRouteInfo _readRouteId]((uint64_t)self);
  routeId = self->_routeId;

  return routeId;
}

- (void)setRouteId:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x48u;
  objc_storeStrong((id *)&self->_routeId, a3);
}

- (void)_readRouteAttributes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOAddStopRouteInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRouteAttributes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasRouteAttributes
{
  return self->_routeAttributes != 0;
}

- (GEORouteAttributes)routeAttributes
{
  -[GEOAddStopRouteInfo _readRouteAttributes]((uint64_t)self);
  routeAttributes = self->_routeAttributes;

  return routeAttributes;
}

- (void)setRouteAttributes:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x44u;
  objc_storeStrong((id *)&self->_routeAttributes, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOAddStopRouteInfo;
  v4 = [(GEOAddStopRouteInfo *)&v8 description];
  v5 = [(GEOAddStopRouteInfo *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOAddStopRouteInfo _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 originalWaypointRouteRepresentation];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 base64EncodedStringWithOptions:0];
        [v4 setObject:v7 forKey:@"originalWaypointRouteRepresentation"];
      }
      else
      {
        [v4 setObject:v5 forKey:@"original_waypoint_route_representation"];
      }
    }

    objc_super v8 = [a1 zilchData];
    v9 = v8;
    if (v8)
    {
      if (a2)
      {
        v10 = [v8 base64EncodedStringWithOptions:0];
        [v4 setObject:v10 forKey:@"zilchData"];
      }
      else
      {
        [v4 setObject:v8 forKey:@"zilch_data"];
      }
    }

    v11 = [a1 sessionState];
    v12 = v11;
    if (v11)
    {
      if (a2)
      {
        v13 = [v11 base64EncodedStringWithOptions:0];
        [v4 setObject:v13 forKey:@"sessionState"];
      }
      else
      {
        [v4 setObject:v11 forKey:@"session_state"];
      }
    }

    v14 = [a1 routeId];
    v15 = v14;
    if (v14)
    {
      if (a2)
      {
        v16 = [v14 base64EncodedStringWithOptions:0];
        [v4 setObject:v16 forKey:@"routeId"];
      }
      else
      {
        [v4 setObject:v14 forKey:@"route_id"];
      }
    }

    v17 = [a1 routeAttributes];
    v18 = v17;
    if (v17)
    {
      if (a2)
      {
        v19 = [v17 jsonRepresentation];
        v20 = @"routeAttributes";
      }
      else
      {
        v19 = [v17 dictionaryRepresentation];
        v20 = @"route_attributes";
      }
      [v4 setObject:v19 forKey:v20];
    }
    v21 = (void *)a1[2];
    if (v21)
    {
      v22 = [v21 dictionaryRepresentation];
      v23 = v22;
      if (a2)
      {
        v24 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v22, "count"));
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __49__GEOAddStopRouteInfo__dictionaryRepresentation___block_invoke;
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
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOAddStopRouteInfo _dictionaryRepresentation:](self, 1);
}

void __49__GEOAddStopRouteInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
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

- (GEOAddStopRouteInfo)initWithDictionary:(id)a3
{
  return (GEOAddStopRouteInfo *)-[GEOAddStopRouteInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"originalWaypointRouteRepresentation";
      }
      else {
        objc_super v6 = @"original_waypoint_route_representation";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v7 options:0];
        [a1 setOriginalWaypointRouteRepresentation:v8];
      }
      if (a3) {
        v9 = @"zilchData";
      }
      else {
        v9 = @"zilch_data";
      }
      id v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v10 options:0];
        [a1 setZilchData:v11];
      }
      if (a3) {
        v12 = @"sessionState";
      }
      else {
        v12 = @"session_state";
      }
      v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v14 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v13 options:0];
        [a1 setSessionState:v14];
      }
      if (a3) {
        v15 = @"routeId";
      }
      else {
        v15 = @"route_id";
      }
      v16 = [v5 objectForKeyedSubscript:v15];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v17 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v16 options:0];
        [a1 setRouteId:v17];
      }
      if (a3) {
        v18 = @"routeAttributes";
      }
      else {
        v18 = @"route_attributes";
      }
      v19 = [v5 objectForKeyedSubscript:v18];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v20 = [GEORouteAttributes alloc];
        if (a3) {
          uint64_t v21 = [(GEORouteAttributes *)v20 initWithJSON:v19];
        }
        else {
          uint64_t v21 = [(GEORouteAttributes *)v20 initWithDictionary:v19];
        }
        v22 = (void *)v21;
        [a1 setRouteAttributes:v21];
      }
    }
  }

  return a1;
}

- (GEOAddStopRouteInfo)initWithJSON:(id)a3
{
  return (GEOAddStopRouteInfo *)-[GEOAddStopRouteInfo _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_53;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_53;
    }
    GEOAddStopRouteInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEORouteAttributes *)self->_routeAttributes readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOAddStopRouteInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOAddStopRouteInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOAddStopRouteInfoIsDirty((uint64_t)self) & 1) == 0)
  {
    objc_super v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOAddStopRouteInfo *)self readAll:0];
    if (self->_originalWaypointRouteRepresentation) {
      PBDataWriterWriteDataField();
    }
    id v5 = v8;
    if (self->_zilchData)
    {
      PBDataWriterWriteDataField();
      id v5 = v8;
    }
    if (self->_sessionState)
    {
      PBDataWriterWriteDataField();
      id v5 = v8;
    }
    if (self->_routeId)
    {
      PBDataWriterWriteDataField();
      id v5 = v8;
    }
    if (self->_routeAttributes)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEOAddStopRouteInfo *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 16) = self->_readerMarkPos;
  *((_DWORD *)v5 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_originalWaypointRouteRepresentation) {
    objc_msgSend(v5, "setOriginalWaypointRouteRepresentation:");
  }
  if (self->_zilchData) {
    objc_msgSend(v5, "setZilchData:");
  }
  v4 = v5;
  if (self->_sessionState)
  {
    objc_msgSend(v5, "setSessionState:");
    v4 = v5;
  }
  if (self->_routeId)
  {
    objc_msgSend(v5, "setRouteId:");
    v4 = v5;
  }
  if (self->_routeAttributes)
  {
    objc_msgSend(v5, "setRouteAttributes:");
    v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  objc_super v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 0x40) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOAddStopRouteInfo *)self readAll:0];
    uint64_t v8 = [(NSData *)self->_originalWaypointRouteRepresentation copyWithZone:a3];
    v9 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v8;

    uint64_t v10 = [(NSData *)self->_zilchData copyWithZone:a3];
    v11 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v10;

    uint64_t v12 = [(NSData *)self->_sessionState copyWithZone:a3];
    v13 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v12;

    uint64_t v14 = [(NSData *)self->_routeId copyWithZone:a3];
    v15 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v14;

    id v16 = [(GEORouteAttributes *)self->_routeAttributes copyWithZone:a3];
    v17 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v16;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOAddStopRouteInfoReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOAddStopRouteInfo *)self readAll:1],
         [v4 readAll:1],
         originalWaypointRouteRepresentation = self->_originalWaypointRouteRepresentation,
         !((unint64_t)originalWaypointRouteRepresentation | v4[3]))
     || -[NSData isEqual:](originalWaypointRouteRepresentation, "isEqual:"))
    && ((zilchData = self->_zilchData, !((unint64_t)zilchData | v4[7]))
     || -[NSData isEqual:](zilchData, "isEqual:"))
    && ((sessionState = self->_sessionState, !((unint64_t)sessionState | v4[6]))
     || -[NSData isEqual:](sessionState, "isEqual:"))
    && ((routeId = self->_routeId, !((unint64_t)routeId | v4[5]))
     || -[NSData isEqual:](routeId, "isEqual:")))
  {
    routeAttributes = self->_routeAttributes;
    if ((unint64_t)routeAttributes | v4[4]) {
      char v10 = -[GEORouteAttributes isEqual:](routeAttributes, "isEqual:");
    }
    else {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  [(GEOAddStopRouteInfo *)self readAll:1];
  uint64_t v3 = [(NSData *)self->_originalWaypointRouteRepresentation hash];
  uint64_t v4 = [(NSData *)self->_zilchData hash] ^ v3;
  uint64_t v5 = [(NSData *)self->_sessionState hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSData *)self->_routeId hash];
  return v6 ^ [(GEORouteAttributes *)self->_routeAttributes hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v6 = a3;
  [v6 readAll:0];
  if (v6[3]) {
    [(GEOAddStopRouteInfo *)self setOriginalWaypointRouteRepresentation:"setOriginalWaypointRouteRepresentation:"];
  }
  if (v6[7]) {
    -[GEOAddStopRouteInfo setZilchData:](self, "setZilchData:");
  }
  if (v6[6]) {
    -[GEOAddStopRouteInfo setSessionState:](self, "setSessionState:");
  }
  if (v6[5]) {
    [(GEOAddStopRouteInfo *)self setRouteId:"setRouteId:"];
  }
  routeAttributes = self->_routeAttributes;
  uint64_t v5 = v6[4];
  if (routeAttributes)
  {
    if (v5) {
      -[GEORouteAttributes mergeFrom:](routeAttributes, "mergeFrom:");
    }
  }
  else if (v5)
  {
    [(GEOAddStopRouteInfo *)self setRouteAttributes:"setRouteAttributes:"];
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
      GEOAddStopRouteInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_11);
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
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x41u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOAddStopRouteInfo *)self readAll:0];
    routeAttributes = self->_routeAttributes;
    [(GEORouteAttributes *)routeAttributes clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zilchData, 0);
  objc_storeStrong((id *)&self->_sessionState, 0);
  objc_storeStrong((id *)&self->_routeId, 0);
  objc_storeStrong((id *)&self->_routeAttributes, 0);
  objc_storeStrong((id *)&self->_originalWaypointRouteRepresentation, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end