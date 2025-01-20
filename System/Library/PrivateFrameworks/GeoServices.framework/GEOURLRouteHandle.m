@interface GEOURLRouteHandle
+ (BOOL)isValid:(id)a3;
- (BOOL)hasDirectionsResponseID;
- (BOOL)hasRouteID;
- (BOOL)hasTransitData;
- (BOOL)hasZilchPoints;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOURLRouteHandle)init;
- (GEOURLRouteHandle)initWithData:(id)a3;
- (GEOURLRouteHandle)initWithDictionary:(id)a3;
- (GEOURLRouteHandle)initWithJSON:(id)a3;
- (NSData)directionsResponseID;
- (NSData)routeID;
- (NSData)transitData;
- (NSData)zilchPoints;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)_readDirectionsResponseID;
- (void)_readRouteID;
- (void)_readTransitData;
- (void)_readZilchPoints;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setDirectionsResponseID:(id)a3;
- (void)setRouteID:(id)a3;
- (void)setTransitData:(id)a3;
- (void)setZilchPoints:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOURLRouteHandle

- (GEOURLRouteHandle)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOURLRouteHandle;
  v2 = [(GEOURLRouteHandle *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOURLRouteHandle)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOURLRouteHandle;
  v3 = [(GEOURLRouteHandle *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readDirectionsResponseID
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLRouteHandleReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDirectionsResponseID_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasDirectionsResponseID
{
  return self->_directionsResponseID != 0;
}

- (NSData)directionsResponseID
{
  -[GEOURLRouteHandle _readDirectionsResponseID]((uint64_t)self);
  directionsResponseID = self->_directionsResponseID;

  return directionsResponseID;
}

- (void)setDirectionsResponseID:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x11u;
  objc_storeStrong((id *)&self->_directionsResponseID, a3);
}

- (void)_readRouteID
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
        GEOURLRouteHandleReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRouteID_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasRouteID
{
  return self->_routeID != 0;
}

- (NSData)routeID
{
  -[GEOURLRouteHandle _readRouteID]((uint64_t)self);
  routeID = self->_routeID;

  return routeID;
}

- (void)setRouteID:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x12u;
  objc_storeStrong((id *)&self->_routeID, a3);
}

- (void)_readZilchPoints
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
        GEOURLRouteHandleReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readZilchPoints_tags_2);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasZilchPoints
{
  return self->_zilchPoints != 0;
}

- (NSData)zilchPoints
{
  -[GEOURLRouteHandle _readZilchPoints]((uint64_t)self);
  zilchPoints = self->_zilchPoints;

  return zilchPoints;
}

- (void)setZilchPoints:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_zilchPoints, a3);
}

- (void)_readTransitData
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
        GEOURLRouteHandleReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTransitData_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasTransitData
{
  return self->_transitData != 0;
}

- (NSData)transitData
{
  -[GEOURLRouteHandle _readTransitData]((uint64_t)self);
  transitData = self->_transitData;

  return transitData;
}

- (void)setTransitData:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_transitData, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOURLRouteHandle;
  v4 = [(GEOURLRouteHandle *)&v8 description];
  v5 = [(GEOURLRouteHandle *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOURLRouteHandle _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 directionsResponseID];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 base64EncodedStringWithOptions:0];
        [v4 setObject:v7 forKey:@"directionsResponseID"];
      }
      else
      {
        [v4 setObject:v5 forKey:@"directionsResponseID"];
      }
    }

    objc_super v8 = [a1 routeID];
    v9 = v8;
    if (v8)
    {
      if (a2)
      {
        v10 = [v8 base64EncodedStringWithOptions:0];
        [v4 setObject:v10 forKey:@"routeID"];
      }
      else
      {
        [v4 setObject:v8 forKey:@"routeID"];
      }
    }

    v11 = [a1 zilchPoints];
    v12 = v11;
    if (v11)
    {
      if (a2)
      {
        v13 = [v11 base64EncodedStringWithOptions:0];
        [v4 setObject:v13 forKey:@"zilchPoints"];
      }
      else
      {
        [v4 setObject:v11 forKey:@"zilchPoints"];
      }
    }

    v14 = [a1 transitData];
    v15 = v14;
    if (v14)
    {
      if (a2)
      {
        v16 = [v14 base64EncodedStringWithOptions:0];
        [v4 setObject:v16 forKey:@"transitData"];
      }
      else
      {
        [v4 setObject:v14 forKey:@"transitData"];
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
  return -[GEOURLRouteHandle _dictionaryRepresentation:](self, 1);
}

- (GEOURLRouteHandle)initWithDictionary:(id)a3
{
  return (GEOURLRouteHandle *)-[GEOURLRouteHandle _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v4 = [v3 objectForKeyedSubscript:@"directionsResponseID"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v4 options:0];
        [a1 setDirectionsResponseID:v5];
      }
      objc_super v6 = [v3 objectForKeyedSubscript:@"routeID"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v6 options:0];
        [a1 setRouteID:v7];
      }
      objc_super v8 = [v3 objectForKeyedSubscript:@"zilchPoints"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v8 options:0];
        [a1 setZilchPoints:v9];
      }
      v10 = [v3 objectForKeyedSubscript:@"transitData"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v10 options:0];
        [a1 setTransitData:v11];
      }
    }
  }

  return a1;
}

- (GEOURLRouteHandle)initWithJSON:(id)a3
{
  return (GEOURLRouteHandle *)-[GEOURLRouteHandle _initWithDictionary:isJSON:](self, a3);
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
      objc_super v8 = (int *)&readAll__recursiveTag_342;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_343;
    }
    GEOURLRouteHandleReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOURLRouteHandleIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOURLRouteHandleReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1F) == 0))
  {
    v5 = self->_reader;
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
    [(GEOURLRouteHandle *)self readAll:0];
    if (self->_directionsResponseID) {
      PBDataWriterWriteDataField();
    }
    if (self->_routeID) {
      PBDataWriterWriteDataField();
    }
    if (self->_zilchPoints) {
      PBDataWriterWriteDataField();
    }
    if (self->_transitData) {
      PBDataWriterWriteDataField();
    }
  }
}

- (void)copyTo:(id)a3
{
  v5 = (id *)a3;
  [(GEOURLRouteHandle *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 12) = self->_readerMarkPos;
  *((_DWORD *)v5 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_directionsResponseID) {
    objc_msgSend(v5, "setDirectionsResponseID:");
  }
  if (self->_routeID) {
    objc_msgSend(v5, "setRouteID:");
  }
  v4 = v5;
  if (self->_zilchPoints)
  {
    objc_msgSend(v5, "setZilchPoints:");
    v4 = v5;
  }
  if (self->_transitData)
  {
    objc_msgSend(v5, "setTransitData:");
    v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  id v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOURLRouteHandle *)self readAll:0];
    uint64_t v8 = [(NSData *)self->_directionsResponseID copyWithZone:a3];
    v9 = (void *)v5[2];
    v5[2] = v8;

    uint64_t v10 = [(NSData *)self->_routeID copyWithZone:a3];
    v11 = (void *)v5[3];
    v5[3] = v10;

    uint64_t v12 = [(NSData *)self->_zilchPoints copyWithZone:a3];
    v13 = (void *)v5[5];
    v5[5] = v12;

    uint64_t v14 = [(NSData *)self->_transitData copyWithZone:a3];
    id v7 = (PBDataReader *)v5[4];
    v5[4] = v14;
    goto LABEL_6;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOURLRouteHandleReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOURLRouteHandle *)self readAll:1],
         [v4 readAll:1],
         directionsResponseID = self->_directionsResponseID,
         !((unint64_t)directionsResponseID | v4[2]))
     || -[NSData isEqual:](directionsResponseID, "isEqual:"))
    && ((routeID = self->_routeID, !((unint64_t)routeID | v4[3]))
     || -[NSData isEqual:](routeID, "isEqual:"))
    && ((zilchPoints = self->_zilchPoints, !((unint64_t)zilchPoints | v4[5]))
     || -[NSData isEqual:](zilchPoints, "isEqual:")))
  {
    transitData = self->_transitData;
    if ((unint64_t)transitData | v4[4]) {
      char v9 = -[NSData isEqual:](transitData, "isEqual:");
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
  [(GEOURLRouteHandle *)self readAll:1];
  uint64_t v3 = [(NSData *)self->_directionsResponseID hash];
  uint64_t v4 = [(NSData *)self->_routeID hash] ^ v3;
  uint64_t v5 = [(NSData *)self->_zilchPoints hash];
  return v4 ^ v5 ^ [(NSData *)self->_transitData hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  [v4 readAll:0];
  if (v4[2]) {
    -[GEOURLRouteHandle setDirectionsResponseID:](self, "setDirectionsResponseID:");
  }
  if (v4[3]) {
    [(GEOURLRouteHandle *)self setRouteID:"setRouteID:"];
  }
  if (v4[5]) {
    -[GEOURLRouteHandle setZilchPoints:](self, "setZilchPoints:");
  }
  if (v4[4]) {
    -[GEOURLRouteHandle setTransitData:](self, "setTransitData:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zilchPoints, 0);
  objc_storeStrong((id *)&self->_transitData, 0);
  objc_storeStrong((id *)&self->_routeID, 0);
  objc_storeStrong((id *)&self->_directionsResponseID, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end