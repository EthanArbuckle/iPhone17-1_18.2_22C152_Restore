@interface GEOTransitRouteIdentifier
+ (BOOL)isValid:(id)a3;
+ (id)routeIdentiferForComposedRoute:(id)a3;
- (BOOL)hasClientRouteHandle;
- (BOOL)hasServerRouteHandle;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOTransitRouteIdentifier)init;
- (GEOTransitRouteIdentifier)initWithData:(id)a3;
- (GEOTransitRouteIdentifier)initWithDictionary:(id)a3;
- (GEOTransitRouteIdentifier)initWithJSON:(id)a3;
- (NSData)clientRouteHandle;
- (NSData)serverRouteHandle;
- (NSUUID)clientRouteID;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readClientRouteHandle;
- (void)_readServerRouteHandle;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setClientRouteHandle:(id)a3;
- (void)setServerRouteHandle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOTransitRouteIdentifier

- (GEOTransitRouteIdentifier)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOTransitRouteIdentifier;
  v2 = [(GEOTransitRouteIdentifier *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTransitRouteIdentifier)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOTransitRouteIdentifier;
  v3 = [(GEOTransitRouteIdentifier *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readServerRouteHandle
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
        GEOTransitRouteIdentifierReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readServerRouteHandle_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasServerRouteHandle
{
  return self->_serverRouteHandle != 0;
}

- (NSData)serverRouteHandle
{
  -[GEOTransitRouteIdentifier _readServerRouteHandle]((uint64_t)self);
  serverRouteHandle = self->_serverRouteHandle;

  return serverRouteHandle;
}

- (void)setServerRouteHandle:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_serverRouteHandle, a3);
}

- (void)_readClientRouteHandle
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
        GEOTransitRouteIdentifierReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readClientRouteHandle_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasClientRouteHandle
{
  return self->_clientRouteHandle != 0;
}

- (NSData)clientRouteHandle
{
  -[GEOTransitRouteIdentifier _readClientRouteHandle]((uint64_t)self);
  clientRouteHandle = self->_clientRouteHandle;

  return clientRouteHandle;
}

- (void)setClientRouteHandle:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xAu;
  objc_storeStrong((id *)&self->_clientRouteHandle, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTransitRouteIdentifier;
  v4 = [(GEOTransitRouteIdentifier *)&v8 description];
  v5 = [(GEOTransitRouteIdentifier *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTransitRouteIdentifier _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 serverRouteHandle];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 base64EncodedStringWithOptions:0];
        [v4 setObject:v7 forKey:@"serverRouteHandle"];
      }
      else
      {
        [v4 setObject:v5 forKey:@"server_route_handle"];
      }
    }

    objc_super v8 = [a1 clientRouteHandle];
    v9 = v8;
    if (v8)
    {
      if (a2)
      {
        v10 = [v8 base64EncodedStringWithOptions:0];
        [v4 setObject:v10 forKey:@"clientRouteHandle"];
      }
      else
      {
        [v4 setObject:v8 forKey:@"client_route_handle"];
      }
    }

    v11 = (void *)a1[2];
    if (v11)
    {
      v12 = [v11 dictionaryRepresentation];
      v13 = v12;
      if (a2)
      {
        v14 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __55__GEOTransitRouteIdentifier__dictionaryRepresentation___block_invoke;
        v18[3] = &unk_1E53D8860;
        id v15 = v14;
        id v19 = v15;
        [v13 enumerateKeysAndObjectsUsingBlock:v18];
        id v16 = v15;

        v13 = v16;
      }
      [v4 setObject:v13 forKey:@"Unknown Fields"];
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
  return -[GEOTransitRouteIdentifier _dictionaryRepresentation:](self, 1);
}

void __55__GEOTransitRouteIdentifier__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOTransitRouteIdentifier)initWithDictionary:(id)a3
{
  return (GEOTransitRouteIdentifier *)-[GEOTransitRouteIdentifier _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"serverRouteHandle";
      }
      else {
        objc_super v6 = @"server_route_handle";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v7 options:0];
        [a1 setServerRouteHandle:v8];
      }
      if (a3) {
        v9 = @"clientRouteHandle";
      }
      else {
        v9 = @"client_route_handle";
      }
      id v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v10 options:0];
        [a1 setClientRouteHandle:v11];
      }
    }
  }

  return a1;
}

- (GEOTransitRouteIdentifier)initWithJSON:(id)a3
{
  return (GEOTransitRouteIdentifier *)-[GEOTransitRouteIdentifier _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_0;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_0;
    }
    GEOTransitRouteIdentifierReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTransitRouteIdentifierIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTransitRouteIdentifierReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0xE) == 0))
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
    [(GEOTransitRouteIdentifier *)self readAll:0];
    if (self->_serverRouteHandle) {
      PBDataWriterWriteDataField();
    }
    id v5 = v8;
    if (self->_clientRouteHandle)
    {
      PBDataWriterWriteDataField();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)copyTo:(id)a3
{
  v4 = (id *)a3;
  [(GEOTransitRouteIdentifier *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 10) = self->_readerMarkPos;
  *((_DWORD *)v4 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_serverRouteHandle) {
    objc_msgSend(v4, "setServerRouteHandle:");
  }
  if (self->_clientRouteHandle) {
    objc_msgSend(v4, "setClientRouteHandle:");
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
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOTransitRouteIdentifier *)self readAll:0];
    uint64_t v8 = [(NSData *)self->_serverRouteHandle copyWithZone:a3];
    v9 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v8;

    uint64_t v10 = [(NSData *)self->_clientRouteHandle copyWithZone:a3];
    v11 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v10;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOTransitRouteIdentifierReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOTransitRouteIdentifier *)self readAll:1],
         [v4 readAll:1],
         serverRouteHandle = self->_serverRouteHandle,
         !((unint64_t)serverRouteHandle | v4[4]))
     || -[NSData isEqual:](serverRouteHandle, "isEqual:")))
  {
    clientRouteHandle = self->_clientRouteHandle;
    if ((unint64_t)clientRouteHandle | v4[3]) {
      char v7 = -[NSData isEqual:](clientRouteHandle, "isEqual:");
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
  [(GEOTransitRouteIdentifier *)self readAll:1];
  uint64_t v3 = [(NSData *)self->_serverRouteHandle hash];
  return [(NSData *)self->_clientRouteHandle hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  [v4 readAll:0];
  if (v4[4]) {
    [(GEOTransitRouteIdentifier *)self setServerRouteHandle:"setServerRouteHandle:"];
  }
  if (v4[3]) {
    [(GEOTransitRouteIdentifier *)self setClientRouteHandle:"setClientRouteHandle:"];
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
      GEOTransitRouteIdentifierReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags);
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
  *(unsigned char *)&self->_flags |= 9u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOTransitRouteIdentifier *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverRouteHandle, 0);
  objc_storeStrong((id *)&self->_clientRouteHandle, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

+ (id)routeIdentiferForComposedRoute:(id)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_alloc_init(GEOTransitRouteIdentifier);
  uint64_t v5 = [v3 suggestedRoute];
  objc_super v6 = [v5 routeHandle];
  [(GEOTransitRouteIdentifier *)v4 setServerRouteHandle:v6];

  v10[0] = 0;
  v10[1] = 0;
  char v7 = [v3 uniqueRouteID];

  [v7 getUUIDBytes:v10];
  uint64_t v8 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v10 length:16];
  [(GEOTransitRouteIdentifier *)v4 setClientRouteHandle:v8];

  return v4;
}

- (NSUUID)clientRouteID
{
  v2 = (void *)MEMORY[0x1E4F29128];
  id v3 = [(GEOTransitRouteIdentifier *)self clientRouteHandle];
  v4 = objc_msgSend(v2, "_maps_UUIDWithData:", v3);

  return (NSUUID *)v4;
}

@end