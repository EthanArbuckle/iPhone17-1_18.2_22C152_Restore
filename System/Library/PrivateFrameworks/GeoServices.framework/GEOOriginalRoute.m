@interface GEOOriginalRoute
+ (BOOL)isValid:(id)a3;
- (BOOL)hasOriginalDirectionsResponseID;
- (BOOL)hasOriginalRoutePurpose;
- (BOOL)hasRouteHandle;
- (BOOL)hasRouteIndex;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOOriginalRoute)init;
- (GEOOriginalRoute)initWithData:(id)a3;
- (GEOOriginalRoute)initWithDictionary:(id)a3;
- (GEOOriginalRoute)initWithJSON:(id)a3;
- (NSData)originalDirectionsResponseID;
- (NSData)routeHandle;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)originalRoutePurposeAsString:(int)a3;
- (int)StringAsOriginalRoutePurpose:(id)a3;
- (int)originalRoutePurpose;
- (unint64_t)hash;
- (unsigned)routeIndex;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readOriginalDirectionsResponseID;
- (void)_readRouteHandle;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setHasOriginalRoutePurpose:(BOOL)a3;
- (void)setHasRouteIndex:(BOOL)a3;
- (void)setOriginalDirectionsResponseID:(id)a3;
- (void)setOriginalRoutePurpose:(int)a3;
- (void)setRouteHandle:(id)a3;
- (void)setRouteIndex:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOOriginalRoute

- (GEOOriginalRoute)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOOriginalRoute;
  v2 = [(GEOOriginalRoute *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOOriginalRoute)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOOriginalRoute;
  v3 = [(GEOOriginalRoute *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)originalRoutePurpose
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_originalRoutePurpose;
  }
  else {
    return -1;
  }
}

- (void)setOriginalRoutePurpose:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x21u;
  self->_originalRoutePurpose = a3;
}

- (void)setHasOriginalRoutePurpose:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasOriginalRoutePurpose
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)originalRoutePurposeAsString:(int)a3
{
  if (a3 == -1)
  {
    v4 = @"PURPOSE_UNKNOWN";
  }
  else if (a3 == 2)
  {
    v4 = @"RETRIEVE_ROUTE_SET";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsOriginalRoutePurpose:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PURPOSE_UNKNOWN"])
  {
    int v4 = -1;
  }
  else if ([v3 isEqualToString:@"RETRIEVE_ROUTE_SET"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = -1;
  }

  return v4;
}

- (void)_readRouteHandle
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
        GEOOriginalRouteReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRouteHandle_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasRouteHandle
{
  return self->_routeHandle != 0;
}

- (NSData)routeHandle
{
  -[GEOOriginalRoute _readRouteHandle]((uint64_t)self);
  routeHandle = self->_routeHandle;

  return routeHandle;
}

- (void)setRouteHandle:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_routeHandle, a3);
}

- (void)_readOriginalDirectionsResponseID
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 60) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOOriginalRouteReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOriginalDirectionsResponseID_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasOriginalDirectionsResponseID
{
  return self->_originalDirectionsResponseID != 0;
}

- (NSData)originalDirectionsResponseID
{
  -[GEOOriginalRoute _readOriginalDirectionsResponseID]((uint64_t)self);
  originalDirectionsResponseID = self->_originalDirectionsResponseID;

  return originalDirectionsResponseID;
}

- (void)setOriginalDirectionsResponseID:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_originalDirectionsResponseID, a3);
}

- (unsigned)routeIndex
{
  return self->_routeIndex;
}

- (void)setRouteIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 0x22u;
  self->_routeIndex = a3;
}

- (void)setHasRouteIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 34;
  }
  else {
    char v3 = 32;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasRouteIndex
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOOriginalRoute;
  int v4 = [(GEOOriginalRoute *)&v8 description];
  v5 = [(GEOOriginalRoute *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOOriginalRoute _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 60))
    {
      int v5 = *(_DWORD *)(a1 + 52);
      if (v5 == -1)
      {
        objc_super v6 = @"PURPOSE_UNKNOWN";
      }
      else if (v5 == 2)
      {
        objc_super v6 = @"RETRIEVE_ROUTE_SET";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 52));
        objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      [v4 setObject:v6 forKey:@"originalRoutePurpose"];
    }
    objc_super v7 = [(id)a1 routeHandle];
    objc_super v8 = v7;
    if (v7)
    {
      if (a2)
      {
        v9 = [v7 base64EncodedStringWithOptions:0];
        [v4 setObject:v9 forKey:@"routeHandle"];
      }
      else
      {
        [v4 setObject:v7 forKey:@"routeHandle"];
      }
    }

    v10 = [(id)a1 originalDirectionsResponseID];
    v11 = v10;
    if (v10)
    {
      if (a2)
      {
        v12 = [v10 base64EncodedStringWithOptions:0];
        [v4 setObject:v12 forKey:@"originalDirectionsResponseID"];
      }
      else
      {
        [v4 setObject:v10 forKey:@"originalDirectionsResponseID"];
      }
    }

    if ((*(unsigned char *)(a1 + 60) & 2) != 0)
    {
      v13 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 56)];
      if (a2) {
        v14 = @"routeIndex";
      }
      else {
        v14 = @"route_index";
      }
      [v4 setObject:v13 forKey:v14];
    }
    v15 = *(void **)(a1 + 16);
    if (v15)
    {
      v16 = [v15 dictionaryRepresentation];
      v17 = v16;
      if (a2)
      {
        v18 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v16, "count"));
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __46__GEOOriginalRoute__dictionaryRepresentation___block_invoke;
        v22[3] = &unk_1E53D8860;
        id v19 = v18;
        id v23 = v19;
        [v17 enumerateKeysAndObjectsUsingBlock:v22];
        id v20 = v19;

        v17 = v20;
      }
      [v4 setObject:v17 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOOriginalRoute _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __46__GEOOriginalRoute__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOOriginalRoute)initWithDictionary:(id)a3
{
  return (GEOOriginalRoute *)-[GEOOriginalRoute _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_23;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_23;
  }
  objc_super v6 = [v5 objectForKeyedSubscript:@"originalRoutePurpose"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if ([v7 isEqualToString:@"PURPOSE_UNKNOWN"])
    {
      uint64_t v8 = 0xFFFFFFFFLL;
    }
    else if ([v7 isEqualToString:@"RETRIEVE_ROUTE_SET"])
    {
      uint64_t v8 = 2;
    }
    else
    {
      uint64_t v8 = 0xFFFFFFFFLL;
    }

    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v6 intValue];
LABEL_12:
    [a1 setOriginalRoutePurpose:v8];
  }

  v9 = [v5 objectForKeyedSubscript:@"routeHandle"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v9 options:0];
    [a1 setRouteHandle:v10];
  }
  v11 = [v5 objectForKeyedSubscript:@"originalDirectionsResponseID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v11 options:0];
    [a1 setOriginalDirectionsResponseID:v12];
  }
  if (a3) {
    v13 = @"routeIndex";
  }
  else {
    v13 = @"route_index";
  }
  v14 = [v5 objectForKeyedSubscript:v13];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setRouteIndex:", objc_msgSend(v14, "unsignedIntValue"));
  }

LABEL_23:
  return a1;
}

- (GEOOriginalRoute)initWithJSON:(id)a3
{
  return (GEOOriginalRoute *)-[GEOOriginalRoute _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_4017;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_4018;
    }
    GEOOriginalRouteReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOOriginalRouteIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOOriginalRouteReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x38) == 0))
  {
    objc_super v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOOriginalRoute *)self readAll:0];
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    id v5 = v8;
    if (self->_routeHandle)
    {
      PBDataWriterWriteDataField();
      id v5 = v8;
    }
    if (self->_originalDirectionsResponseID)
    {
      PBDataWriterWriteDataField();
      id v5 = v8;
    }
    if ((*(unsigned char *)&self->_flags & 2) != 0)
    {
      PBDataWriterWriteUint32Field();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)copyTo:(id)a3
{
  int v4 = (id *)a3;
  [(GEOOriginalRoute *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 10) = self->_readerMarkPos;
  *((_DWORD *)v4 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v4 + 13) = self->_originalRoutePurpose;
    *((unsigned char *)v4 + 60) |= 1u;
  }
  if (self->_routeHandle) {
    objc_msgSend(v4, "setRouteHandle:");
  }
  if (self->_originalDirectionsResponseID) {
    objc_msgSend(v4, "setOriginalDirectionsResponseID:");
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v4 + 14) = self->_routeIndex;
    *((unsigned char *)v4 + 60) |= 2u;
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
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOOriginalRouteReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOOriginalRoute *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 52) = self->_originalRoutePurpose;
    *(unsigned char *)(v5 + 60) |= 1u;
  }
  uint64_t v9 = [(NSData *)self->_routeHandle copyWithZone:a3];
  id v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  uint64_t v11 = [(NSData *)self->_originalDirectionsResponseID copyWithZone:a3];
  v12 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v11;

  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_routeIndex;
    *(unsigned char *)(v5 + 60) |= 2u;
  }
  v13 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v13;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  [(GEOOriginalRoute *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_originalRoutePurpose != *((_DWORD *)v4 + 13)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
LABEL_15:
    BOOL v7 = 0;
    goto LABEL_16;
  }
  routeHandle = self->_routeHandle;
  if ((unint64_t)routeHandle | *((void *)v4 + 4) && !-[NSData isEqual:](routeHandle, "isEqual:")) {
    goto LABEL_15;
  }
  originalDirectionsResponseID = self->_originalDirectionsResponseID;
  if ((unint64_t)originalDirectionsResponseID | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](originalDirectionsResponseID, "isEqual:")) {
      goto LABEL_15;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 60) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0 || self->_routeIndex != *((_DWORD *)v4 + 14)) {
      goto LABEL_15;
    }
    BOOL v7 = 1;
  }
LABEL_16:

  return v7;
}

- (unint64_t)hash
{
  [(GEOOriginalRoute *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_originalRoutePurpose;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSData *)self->_routeHandle hash];
  uint64_t v5 = [(NSData *)self->_originalDirectionsResponseID hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v6 = 2654435761 * self->_routeIndex;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5 = (int *)a3;
  [v5 readAll:0];
  uint64_t v4 = v5;
  if (v5[15])
  {
    self->_originalRoutePurpose = v5[13];
    *(unsigned char *)&self->_flags |= 1u;
  }
  if (*((void *)v5 + 4))
  {
    [(GEOOriginalRoute *)self setRouteHandle:"setRouteHandle:"];
    uint64_t v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[GEOOriginalRoute setOriginalDirectionsResponseID:](self, "setOriginalDirectionsResponseID:");
    uint64_t v4 = v5;
  }
  if ((v4[15] & 2) != 0)
  {
    self->_routeIndex = v4[14];
    *(unsigned char *)&self->_flags |= 2u;
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOOriginalRouteReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_4022);
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
  *(unsigned char *)&self->_flags |= 0x24u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOOriginalRoute *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeHandle, 0);
  objc_storeStrong((id *)&self->_originalDirectionsResponseID, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end