@interface GEORPPlaceInfo
+ (BOOL)isValid:(id)a3;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasPlaceRequest;
- (BOOL)hasPlaceResponse;
- (BOOL)hasSourceApplication;
- (BOOL)hasSourceUrl;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDPlaceRequest)placeRequest;
- (GEOPDPlaceResponse)placeResponse;
- (GEORPPlaceInfo)init;
- (GEORPPlaceInfo)initWithData:(id)a3;
- (GEORPPlaceInfo)initWithDictionary:(id)a3;
- (GEORPPlaceInfo)initWithJSON:(id)a3;
- (NSString)sourceApplication;
- (NSString)sourceUrl;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readPlaceRequest;
- (void)_readPlaceResponse;
- (void)_readSourceApplication;
- (void)_readSourceUrl;
- (void)clearLocations;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)clearSessionId;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setPlaceRequest:(id)a3;
- (void)setPlaceResponse:(id)a3;
- (void)setSourceApplication:(id)a3;
- (void)setSourceUrl:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPPlaceInfo

- (GEORPPlaceInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPPlaceInfo;
  v2 = [(GEORPPlaceInfo *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPPlaceInfo)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPPlaceInfo;
  v3 = [(GEORPPlaceInfo *)&v7 initWithData:a3];
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPPlaceInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceRequest_tags_1906);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasPlaceRequest
{
  return self->_placeRequest != 0;
}

- (GEOPDPlaceRequest)placeRequest
{
  -[GEORPPlaceInfo _readPlaceRequest]((uint64_t)self);
  placeRequest = self->_placeRequest;

  return placeRequest;
}

- (void)setPlaceRequest:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x11u;
  objc_storeStrong((id *)&self->_placeRequest, a3);
}

- (void)_readPlaceResponse
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
        GEORPPlaceInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceResponse_tags_1907);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasPlaceResponse
{
  return self->_placeResponse != 0;
}

- (GEOPDPlaceResponse)placeResponse
{
  -[GEORPPlaceInfo _readPlaceResponse]((uint64_t)self);
  placeResponse = self->_placeResponse;

  return placeResponse;
}

- (void)setPlaceResponse:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x12u;
  objc_storeStrong((id *)&self->_placeResponse, a3);
}

- (void)_readSourceApplication
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
        GEORPPlaceInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSourceApplication_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasSourceApplication
{
  return self->_sourceApplication != 0;
}

- (NSString)sourceApplication
{
  -[GEORPPlaceInfo _readSourceApplication]((uint64_t)self);
  sourceApplication = self->_sourceApplication;

  return sourceApplication;
}

- (void)setSourceApplication:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_sourceApplication, a3);
}

- (void)_readSourceUrl
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
        GEORPPlaceInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSourceUrl_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasSourceUrl
{
  return self->_sourceUrl != 0;
}

- (NSString)sourceUrl
{
  -[GEORPPlaceInfo _readSourceUrl]((uint64_t)self);
  sourceUrl = self->_sourceUrl;

  return sourceUrl;
}

- (void)setSourceUrl:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_sourceUrl, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPPlaceInfo;
  v4 = [(GEORPPlaceInfo *)&v8 description];
  v5 = [(GEORPPlaceInfo *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPPlaceInfo _dictionaryRepresentation:](self, 0);
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
    v13 = [a1 sourceApplication];
    if (v13)
    {
      if (a2) {
        v14 = @"sourceApplication";
      }
      else {
        v14 = @"source_application";
      }
      [v4 setObject:v13 forKey:v14];
    }

    v15 = [a1 sourceUrl];
    if (v15)
    {
      if (a2) {
        v16 = @"sourceUrl";
      }
      else {
        v16 = @"source_url";
      }
      [v4 setObject:v15 forKey:v16];
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
  return -[GEORPPlaceInfo _dictionaryRepresentation:](self, 1);
}

- (GEORPPlaceInfo)initWithDictionary:(id)a3
{
  return (GEORPPlaceInfo *)-[GEORPPlaceInfo _initWithDictionary:isJSON:](self, a3, 0);
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
        v10 = (void *)v9;
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
      if (a3) {
        v16 = @"sourceApplication";
      }
      else {
        v16 = @"source_application";
      }
      v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v18 = (void *)[v17 copy];
        [a1 setSourceApplication:v18];
      }
      if (a3) {
        v19 = @"sourceUrl";
      }
      else {
        v19 = @"source_url";
      }
      v20 = [v5 objectForKeyedSubscript:v19];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v21 = (void *)[v20 copy];
        [a1 setSourceUrl:v21];
      }
    }
  }

  return a1;
}

- (GEORPPlaceInfo)initWithJSON:(id)a3
{
  return (GEORPPlaceInfo *)-[GEORPPlaceInfo _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_1920;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_1921;
    }
    GEORPPlaceInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
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
  return GEORPPlaceInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPPlaceInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPPlaceInfoIsDirty((uint64_t)self) & 1) == 0)
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
    [(GEORPPlaceInfo *)self readAll:0];
    if (self->_placeRequest) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_placeResponse) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_sourceApplication) {
      PBDataWriterWriteStringField();
    }
    if (self->_sourceUrl) {
      PBDataWriterWriteStringField();
    }
  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEORPPlaceInfo _readPlaceRequest]((uint64_t)self);
  if ([(GEOPDPlaceRequest *)self->_placeRequest hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORPPlaceInfo _readPlaceResponse]((uint64_t)self);
  placeResponse = self->_placeResponse;

  return [(GEOPDPlaceResponse *)placeResponse hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEORPPlaceInfo *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 12) = self->_readerMarkPos;
  *((_DWORD *)v5 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_placeRequest) {
    objc_msgSend(v5, "setPlaceRequest:");
  }
  if (self->_placeResponse) {
    objc_msgSend(v5, "setPlaceResponse:");
  }
  v4 = v5;
  if (self->_sourceApplication)
  {
    objc_msgSend(v5, "setSourceApplication:");
    v4 = v5;
  }
  if (self->_sourceUrl)
  {
    objc_msgSend(v5, "setSourceUrl:");
    v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
    [(GEORPPlaceInfo *)self readAll:0];
    id v8 = [(GEOPDPlaceRequest *)self->_placeRequest copyWithZone:a3];
    uint64_t v9 = (void *)v5[2];
    v5[2] = v8;

    id v10 = [(GEOPDPlaceResponse *)self->_placeResponse copyWithZone:a3];
    v11 = (void *)v5[3];
    v5[3] = v10;

    uint64_t v12 = [(NSString *)self->_sourceApplication copyWithZone:a3];
    v13 = (void *)v5[4];
    v5[4] = v12;

    uint64_t v14 = [(NSString *)self->_sourceUrl copyWithZone:a3];
    id v7 = (PBDataReader *)v5[5];
    v5[5] = v14;
    goto LABEL_6;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEORPPlaceInfoReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEORPPlaceInfo *)self readAll:1],
         [v4 readAll:1],
         placeRequest = self->_placeRequest,
         !((unint64_t)placeRequest | v4[2]))
     || -[GEOPDPlaceRequest isEqual:](placeRequest, "isEqual:"))
    && ((placeResponse = self->_placeResponse, !((unint64_t)placeResponse | v4[3]))
     || -[GEOPDPlaceResponse isEqual:](placeResponse, "isEqual:"))
    && ((sourceApplication = self->_sourceApplication, !((unint64_t)sourceApplication | v4[4]))
     || -[NSString isEqual:](sourceApplication, "isEqual:")))
  {
    sourceUrl = self->_sourceUrl;
    if ((unint64_t)sourceUrl | v4[5]) {
      char v9 = -[NSString isEqual:](sourceUrl, "isEqual:");
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
  [(GEORPPlaceInfo *)self readAll:1];
  unint64_t v3 = [(GEOPDPlaceRequest *)self->_placeRequest hash];
  unint64_t v4 = [(GEOPDPlaceResponse *)self->_placeResponse hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_sourceApplication hash];
  return v4 ^ v5 ^ [(NSString *)self->_sourceUrl hash];
}

- (void)mergeFrom:(id)a3
{
  id v8 = a3;
  [v8 readAll:0];
  placeRequest = self->_placeRequest;
  uint64_t v5 = v8[2];
  if (placeRequest)
  {
    if (v5) {
      -[GEOPDPlaceRequest mergeFrom:](placeRequest, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEORPPlaceInfo setPlaceRequest:](self, "setPlaceRequest:");
  }
  placeResponse = self->_placeResponse;
  uint64_t v7 = v8[3];
  if (placeResponse)
  {
    if (v7) {
      -[GEOPDPlaceResponse mergeFrom:](placeResponse, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[GEORPPlaceInfo setPlaceResponse:](self, "setPlaceResponse:");
  }
  if (v8[4]) {
    -[GEORPPlaceInfo setSourceApplication:](self, "setSourceApplication:");
  }
  if (v8[5]) {
    -[GEORPPlaceInfo setSourceUrl:](self, "setSourceUrl:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceUrl, 0);
  objc_storeStrong((id *)&self->_sourceApplication, 0);
  objc_storeStrong((id *)&self->_placeResponse, 0);
  objc_storeStrong((id *)&self->_placeRequest, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)clearSessionId
{
  unint64_t v3 = [(GEORPPlaceInfo *)self placeRequest];
  unint64_t v4 = [v3 analyticMetadata];
  int v5 = [v4 hasSessionId];

  if (v5)
  {
    objc_super v6 = [(GEORPPlaceInfo *)self placeRequest];
    id v9 = (id)[v6 copy];

    uint64_t v7 = [v9 analyticMetadata];
    objc_msgSend(v7, "setSessionId:", 0, 0);

    id v8 = [v9 analyticMetadata];
    [v8 setHasSessionId:0];

    [(GEORPPlaceInfo *)self setPlaceRequest:v9];
  }
}

- (void)clearLocations
{
  unint64_t v3 = [(GEORPPlaceInfo *)self placeResponse];
  _clearedPlaceResponseFromResponse(v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6) {
    [(GEORPPlaceInfo *)self setPlaceResponse:v6];
  }
  unint64_t v4 = [(GEORPPlaceInfo *)self placeRequest];
  int v5 = _clearedPlaceRequestFromRequest(v4);

  if (v5) {
    [(GEORPPlaceInfo *)self setPlaceRequest:v5];
  }
}

@end