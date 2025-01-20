@interface GEORPPlaceRequestResponse
+ (BOOL)isValid:(id)a3;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasPlaceRequest;
- (BOOL)hasPlaceResponse;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDPlaceRequest)placeRequest;
- (GEOPDPlaceResponse)placeResponse;
- (GEORPPlaceRequestResponse)init;
- (GEORPPlaceRequestResponse)initWithData:(id)a3;
- (GEORPPlaceRequestResponse)initWithDictionary:(id)a3;
- (GEORPPlaceRequestResponse)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readPlaceRequest;
- (void)_readPlaceResponse;
- (void)clearLocations;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setPlaceRequest:(id)a3;
- (void)setPlaceResponse:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPPlaceRequestResponse

- (GEORPPlaceRequestResponse)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPPlaceRequestResponse;
  v2 = [(GEORPPlaceRequestResponse *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPPlaceRequestResponse)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPPlaceRequestResponse;
  v3 = [(GEORPPlaceRequestResponse *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readPlaceRequest
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
        GEORPPlaceRequestResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceRequest_tags_2873);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasPlaceRequest
{
  return self->_placeRequest != 0;
}

- (GEOPDPlaceRequest)placeRequest
{
  -[GEORPPlaceRequestResponse _readPlaceRequest]((uint64_t)self);
  placeRequest = self->_placeRequest;

  return placeRequest;
}

- (void)setPlaceRequest:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xAu;
  objc_storeStrong((id *)&self->_placeRequest, a3);
}

- (void)_readPlaceResponse
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
        GEORPPlaceRequestResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceResponse_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasPlaceResponse
{
  return self->_placeResponse != 0;
}

- (GEOPDPlaceResponse)placeResponse
{
  -[GEORPPlaceRequestResponse _readPlaceResponse]((uint64_t)self);
  placeResponse = self->_placeResponse;

  return placeResponse;
}

- (void)setPlaceResponse:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_placeResponse, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPPlaceRequestResponse;
  v4 = [(GEORPPlaceRequestResponse *)&v8 description];
  v5 = [(GEORPPlaceRequestResponse *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPPlaceRequestResponse _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 placeRequest];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 jsonRepresentation];
        objc_super v8 = @"placeRequest";
      }
      else
      {
        objc_super v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"place_request";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = [a1 placeResponse];
    v10 = v9;
    if (v9)
    {
      if (a2)
      {
        v11 = [v9 jsonRepresentation];
        v12 = @"placeResponse";
      }
      else
      {
        v11 = [v9 dictionaryRepresentation];
        v12 = @"place_response";
      }
      [v4 setObject:v11 forKey:v12];
    }
    v13 = (void *)a1[2];
    if (v13)
    {
      v14 = [v13 dictionaryRepresentation];
      v15 = v14;
      if (a2)
      {
        v16 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __55__GEORPPlaceRequestResponse__dictionaryRepresentation___block_invoke;
        v20[3] = &unk_1E53D8860;
        id v17 = v16;
        id v21 = v17;
        [v15 enumerateKeysAndObjectsUsingBlock:v20];
        id v18 = v17;

        v15 = v18;
      }
      [v4 setObject:v15 forKey:@"Unknown Fields"];
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
  return -[GEORPPlaceRequestResponse _dictionaryRepresentation:](self, 1);
}

void __55__GEORPPlaceRequestResponse__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPPlaceRequestResponse)initWithDictionary:(id)a3
{
  return (GEORPPlaceRequestResponse *)-[GEORPPlaceRequestResponse _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"placeRequest";
      }
      else {
        objc_super v6 = @"place_request";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEOPDPlaceRequest alloc];
        if (a3) {
          uint64_t v9 = [(GEOPDPlaceRequest *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEOPDPlaceRequest *)v8 initWithDictionary:v7];
        }
        id v10 = (void *)v9;
        [a1 setPlaceRequest:v9];
      }
      if (a3) {
        v11 = @"placeResponse";
      }
      else {
        v11 = @"place_response";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = [GEOPDPlaceResponse alloc];
        if (a3) {
          uint64_t v14 = [(GEOPDPlaceResponse *)v13 initWithJSON:v12];
        }
        else {
          uint64_t v14 = [(GEOPDPlaceResponse *)v13 initWithDictionary:v12];
        }
        v15 = (void *)v14;
        [a1 setPlaceResponse:v14];
      }
    }
  }

  return a1;
}

- (GEORPPlaceRequestResponse)initWithJSON:(id)a3
{
  return (GEORPPlaceRequestResponse *)-[GEORPPlaceRequestResponse _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_2881;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_2882;
    }
    GEORPPlaceRequestResponseReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEOPDPlaceRequest *)self->_placeRequest readAll:1];
    [(GEOPDPlaceResponse *)self->_placeResponse readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPPlaceRequestResponseIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPPlaceRequestResponseReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPPlaceRequestResponseIsDirty((uint64_t)self) & 1) == 0)
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
    [(GEORPPlaceRequestResponse *)self readAll:0];
    if (self->_placeRequest) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v8;
    if (self->_placeResponse)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEORPPlaceRequestResponse _readPlaceRequest]((uint64_t)self);
  if ([(GEOPDPlaceRequest *)self->_placeRequest hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORPPlaceRequestResponse _readPlaceResponse]((uint64_t)self);
  placeResponse = self->_placeResponse;

  return [(GEOPDPlaceResponse *)placeResponse hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  v4 = (id *)a3;
  [(GEORPPlaceRequestResponse *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 10) = self->_readerMarkPos;
  *((_DWORD *)v4 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_placeRequest) {
    objc_msgSend(v4, "setPlaceRequest:");
  }
  if (self->_placeResponse) {
    objc_msgSend(v4, "setPlaceResponse:");
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
    [(GEORPPlaceRequestResponse *)self readAll:0];
    id v8 = [(GEOPDPlaceRequest *)self->_placeRequest copyWithZone:a3];
    uint64_t v9 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v8;

    id v10 = [(GEOPDPlaceResponse *)self->_placeResponse copyWithZone:a3];
    v11 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v10;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEORPPlaceRequestResponseReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEORPPlaceRequestResponse *)self readAll:1],
         [v4 readAll:1],
         placeRequest = self->_placeRequest,
         !((unint64_t)placeRequest | v4[3]))
     || -[GEOPDPlaceRequest isEqual:](placeRequest, "isEqual:")))
  {
    placeResponse = self->_placeResponse;
    if ((unint64_t)placeResponse | v4[4]) {
      char v7 = -[GEOPDPlaceResponse isEqual:](placeResponse, "isEqual:");
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
  [(GEORPPlaceRequestResponse *)self readAll:1];
  unint64_t v3 = [(GEOPDPlaceRequest *)self->_placeRequest hash];
  return [(GEOPDPlaceResponse *)self->_placeResponse hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v8 = a3;
  [v8 readAll:0];
  placeRequest = self->_placeRequest;
  uint64_t v5 = v8[3];
  if (placeRequest)
  {
    if (v5) {
      -[GEOPDPlaceRequest mergeFrom:](placeRequest, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEORPPlaceRequestResponse setPlaceRequest:](self, "setPlaceRequest:");
  }
  placeResponse = self->_placeResponse;
  uint64_t v7 = v8[4];
  if (placeResponse)
  {
    if (v7) {
      -[GEOPDPlaceResponse mergeFrom:](placeResponse, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[GEORPPlaceRequestResponse setPlaceResponse:](self, "setPlaceResponse:");
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
      GEORPPlaceRequestResponseReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_2886);
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
    [(GEORPPlaceRequestResponse *)self readAll:0];
    [(GEOPDPlaceRequest *)self->_placeRequest clearUnknownFields:1];
    placeResponse = self->_placeResponse;
    [(GEOPDPlaceResponse *)placeResponse clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeResponse, 0);
  objc_storeStrong((id *)&self->_placeRequest, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)clearLocations
{
  BOOL v3 = [(GEORPPlaceRequestResponse *)self placeResponse];
  _clearedPlaceResponseFromResponse(v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6) {
    [(GEORPPlaceRequestResponse *)self setPlaceResponse:v6];
  }
  v4 = [(GEORPPlaceRequestResponse *)self placeRequest];
  uint64_t v5 = _clearedPlaceRequestFromRequest(v4);

  if (v5) {
    [(GEORPPlaceRequestResponse *)self setPlaceRequest:v5];
  }
}

@end