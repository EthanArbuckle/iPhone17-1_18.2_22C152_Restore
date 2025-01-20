@interface GEOStorageResumeRouteHandle
+ (BOOL)isValid:(id)a3;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasHasVisitedFirstStop;
- (BOOL)hasRouteGeometry;
- (BOOL)hasServerSessionState;
- (BOOL)hasVisitedFirstStop;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOOriginalWaypointRoute)routeGeometry;
- (GEOStorageResumeRouteHandle)init;
- (GEOStorageResumeRouteHandle)initWithData:(id)a3;
- (GEOStorageResumeRouteHandle)initWithDictionary:(id)a3;
- (GEOStorageResumeRouteHandle)initWithJSON:(id)a3;
- (NSData)serverSessionState;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readRouteGeometry;
- (void)_readServerSessionState;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setHasHasVisitedFirstStop:(BOOL)a3;
- (void)setHasVisitedFirstStop:(BOOL)a3;
- (void)setRouteGeometry:(id)a3;
- (void)setServerSessionState:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOStorageResumeRouteHandle

- (GEOStorageResumeRouteHandle)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOStorageResumeRouteHandle;
  v2 = [(GEOStorageResumeRouteHandle *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOStorageResumeRouteHandle)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOStorageResumeRouteHandle;
  v3 = [(GEOStorageResumeRouteHandle *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readRouteGeometry
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOStorageResumeRouteHandleReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRouteGeometry_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasRouteGeometry
{
  return self->_routeGeometry != 0;
}

- (GEOOriginalWaypointRoute)routeGeometry
{
  -[GEOStorageResumeRouteHandle _readRouteGeometry]((uint64_t)self);
  routeGeometry = self->_routeGeometry;

  return routeGeometry;
}

- (void)setRouteGeometry:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_routeGeometry, a3);
}

- (void)_readServerSessionState
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOStorageResumeRouteHandleReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readServerSessionState_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasServerSessionState
{
  return self->_serverSessionState != 0;
}

- (NSData)serverSessionState
{
  -[GEOStorageResumeRouteHandle _readServerSessionState]((uint64_t)self);
  serverSessionState = self->_serverSessionState;

  return serverSessionState;
}

- (void)setServerSessionState:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_serverSessionState, a3);
}

- (BOOL)hasVisitedFirstStop
{
  return self->_hasVisitedFirstStop;
}

- (void)setHasVisitedFirstStop:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x11u;
  self->_hasVisitedFirstStop = a3;
}

- (void)setHasHasVisitedFirstStop:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasHasVisitedFirstStop
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOStorageResumeRouteHandle;
  v4 = [(GEOStorageResumeRouteHandle *)&v8 description];
  v5 = [(GEOStorageResumeRouteHandle *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOStorageResumeRouteHandle _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 routeGeometry];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      objc_super v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"routeGeometry"];
    }
    objc_super v8 = [(id)a1 serverSessionState];
    v9 = v8;
    if (v8)
    {
      if (a2)
      {
        v10 = [v8 base64EncodedStringWithOptions:0];
        [v4 setObject:v10 forKey:@"serverSessionState"];
      }
      else
      {
        [v4 setObject:v8 forKey:@"serverSessionState"];
      }
    }

    if (*(unsigned char *)(a1 + 56))
    {
      v11 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 52)];
      [v4 setObject:v11 forKey:@"hasVisitedFirstStop"];
    }
    v12 = *(void **)(a1 + 16);
    if (v12)
    {
      v13 = [v12 dictionaryRepresentation];
      v14 = v13;
      if (a2)
      {
        v15 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __57__GEOStorageResumeRouteHandle__dictionaryRepresentation___block_invoke;
        v19[3] = &unk_1E53D8860;
        id v16 = v15;
        id v20 = v16;
        [v14 enumerateKeysAndObjectsUsingBlock:v19];
        id v17 = v16;

        v14 = v17;
      }
      [v4 setObject:v14 forKey:@"Unknown Fields"];
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
  return -[GEOStorageResumeRouteHandle _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __57__GEOStorageResumeRouteHandle__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOStorageResumeRouteHandle)initWithDictionary:(id)a3
{
  return (GEOStorageResumeRouteHandle *)-[GEOStorageResumeRouteHandle _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"routeGeometry"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v7 = [GEOOriginalWaypointRoute alloc];
        if (a3) {
          uint64_t v8 = [(GEOOriginalWaypointRoute *)v7 initWithJSON:v6];
        }
        else {
          uint64_t v8 = [(GEOOriginalWaypointRoute *)v7 initWithDictionary:v6];
        }
        v9 = (void *)v8;
        [a1 setRouteGeometry:v8];
      }
      id v10 = [v5 objectForKeyedSubscript:@"serverSessionState"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v10 options:0];
        [a1 setServerSessionState:v11];
      }
      v12 = [v5 objectForKeyedSubscript:@"hasVisitedFirstStop"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setHasVisitedFirstStop:", objc_msgSend(v12, "BOOLValue"));
      }
    }
  }

  return a1;
}

- (GEOStorageResumeRouteHandle)initWithJSON:(id)a3
{
  return (GEOStorageResumeRouteHandle *)-[GEOStorageResumeRouteHandle _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_30;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_30;
    }
    GEOStorageResumeRouteHandleReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEOOriginalWaypointRoute *)self->_routeGeometry readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOStorageResumeRouteHandleIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOStorageResumeRouteHandleReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1C) == 0))
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
    [(GEOStorageResumeRouteHandle *)self readAll:0];
    if (self->_routeGeometry) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v8;
    if (self->_serverSessionState)
    {
      PBDataWriterWriteDataField();
      id v5 = v8;
    }
    if (*(unsigned char *)&self->_flags)
    {
      PBDataWriterWriteBOOLField();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOStorageResumeRouteHandle _readRouteGeometry]((uint64_t)self);
  routeGeometry = self->_routeGeometry;

  return [(GEOOriginalWaypointRoute *)routeGeometry hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  v4 = (id *)a3;
  [(GEOStorageResumeRouteHandle *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 10) = self->_readerMarkPos;
  *((_DWORD *)v4 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_routeGeometry) {
    objc_msgSend(v4, "setRouteGeometry:");
  }
  if (self->_serverSessionState) {
    objc_msgSend(v4, "setServerSessionState:");
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((unsigned char *)v4 + 52) = self->_hasVisitedFirstStop;
    *((unsigned char *)v4 + 56) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOStorageResumeRouteHandleReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOStorageResumeRouteHandle *)self readAll:0];
  id v9 = [(GEOOriginalWaypointRoute *)self->_routeGeometry copyWithZone:a3];
  id v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  uint64_t v11 = [(NSData *)self->_serverSessionState copyWithZone:a3];
  v12 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v11;

  if (*(unsigned char *)&self->_flags)
  {
    *(unsigned char *)(v5 + 52) = self->_hasVisitedFirstStop;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  v13 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v13;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  [(GEOStorageResumeRouteHandle *)self readAll:1];
  [v4 readAll:1];
  routeGeometry = self->_routeGeometry;
  if ((unint64_t)routeGeometry | *((void *)v4 + 3))
  {
    if (!-[GEOOriginalWaypointRoute isEqual:](routeGeometry, "isEqual:")) {
      goto LABEL_8;
    }
  }
  serverSessionState = self->_serverSessionState;
  if ((unint64_t)serverSessionState | *((void *)v4 + 4))
  {
    if (!-[NSData isEqual:](serverSessionState, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 56) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0)
    {
LABEL_8:
      BOOL v7 = 0;
      goto LABEL_9;
    }
    if (self->_hasVisitedFirstStop)
    {
      if (!*((unsigned char *)v4 + 52)) {
        goto LABEL_8;
      }
    }
    else if (*((unsigned char *)v4 + 52))
    {
      goto LABEL_8;
    }
    BOOL v7 = 1;
  }
LABEL_9:

  return v7;
}

- (unint64_t)hash
{
  [(GEOStorageResumeRouteHandle *)self readAll:1];
  unint64_t v3 = [(GEOOriginalWaypointRoute *)self->_routeGeometry hash];
  uint64_t v4 = [(NSData *)self->_serverSessionState hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v5 = 2654435761 * self->_hasVisitedFirstStop;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  BOOL v7 = a3;
  [v7 readAll:0];
  routeGeometry = self->_routeGeometry;
  uint64_t v5 = v7[3];
  if (routeGeometry)
  {
    if (v5) {
      -[GEOOriginalWaypointRoute mergeFrom:](routeGeometry, "mergeFrom:");
    }
  }
  else if (v5)
  {
    [(GEOStorageResumeRouteHandle *)self setRouteGeometry:"setRouteGeometry:"];
  }
  objc_super v6 = (BOOL *)v7;
  if (v7[4])
  {
    -[GEOStorageResumeRouteHandle setServerSessionState:](self, "setServerSessionState:");
    objc_super v6 = (BOOL *)v7;
  }
  if (v6[56])
  {
    self->_hasVisitedFirstStop = v6[52];
    *(unsigned char *)&self->_flags |= 1u;
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOStorageResumeRouteHandleReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_7);
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
  *(unsigned char *)&self->_flags |= 0x12u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOStorageResumeRouteHandle *)self readAll:0];
    routeGeometry = self->_routeGeometry;
    [(GEOOriginalWaypointRoute *)routeGeometry clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSessionState, 0);
  objc_storeStrong((id *)&self->_routeGeometry, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end