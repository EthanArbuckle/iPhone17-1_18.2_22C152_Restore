@interface GEORPCorrectedSearch
+ (BOOL)isValid:(id)a3;
- (BOOL)containsReportableData;
- (BOOL)hasCorrectedSearchResultIndex;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasOriginalSearchResultIndex;
- (BOOL)hasPlaceRequest;
- (BOOL)hasPlaceResponse;
- (BOOL)hasPlaceSearchRequest;
- (BOOL)hasPlaceSearchResponse;
- (BOOL)hasPreferredSearchDisplayLocation;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDPlaceRequest)placeRequest;
- (GEOPDPlaceResponse)placeResponse;
- (GEOPlaceSearchRequest)placeSearchRequest;
- (GEOPlaceSearchResponse)placeSearchResponse;
- (GEORPCorrectedSearch)init;
- (GEORPCorrectedSearch)initWithData:(id)a3;
- (GEORPCorrectedSearch)initWithDictionary:(id)a3;
- (GEORPCorrectedSearch)initWithJSON:(id)a3;
- (NSString)preferredSearchDisplayLocation;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unsigned)correctedSearchResultIndex;
- (unsigned)originalSearchResultIndex;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readPlaceRequest;
- (void)_readPlaceResponse;
- (void)_readPlaceSearchRequest;
- (void)_readPlaceSearchResponse;
- (void)_readPreferredSearchDisplayLocation;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setCorrectedSearchResultIndex:(unsigned int)a3;
- (void)setHasCorrectedSearchResultIndex:(BOOL)a3;
- (void)setHasOriginalSearchResultIndex:(BOOL)a3;
- (void)setOriginalSearchResultIndex:(unsigned int)a3;
- (void)setPlaceRequest:(id)a3;
- (void)setPlaceResponse:(id)a3;
- (void)setPlaceSearchRequest:(id)a3;
- (void)setPlaceSearchResponse:(id)a3;
- (void)setPreferredSearchDisplayLocation:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPCorrectedSearch

- (GEORPCorrectedSearch)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPCorrectedSearch;
  v2 = [(GEORPCorrectedSearch *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPCorrectedSearch)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPCorrectedSearch;
  v3 = [(GEORPCorrectedSearch *)&v7 initWithData:a3];
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPCorrectedSearchReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceSearchRequest_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasPlaceSearchRequest
{
  return self->_placeSearchRequest != 0;
}

- (GEOPlaceSearchRequest)placeSearchRequest
{
  -[GEORPCorrectedSearch _readPlaceSearchRequest]((uint64_t)self);
  placeSearchRequest = self->_placeSearchRequest;

  return placeSearchRequest;
}

- (void)setPlaceSearchRequest:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_placeSearchRequest, a3);
}

- (void)_readPlaceSearchResponse
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPCorrectedSearchReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceSearchResponse_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasPlaceSearchResponse
{
  return self->_placeSearchResponse != 0;
}

- (GEOPlaceSearchResponse)placeSearchResponse
{
  -[GEORPCorrectedSearch _readPlaceSearchResponse]((uint64_t)self);
  placeSearchResponse = self->_placeSearchResponse;

  return placeSearchResponse;
}

- (void)setPlaceSearchResponse:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_placeSearchResponse, a3);
}

- (unsigned)originalSearchResultIndex
{
  return self->_originalSearchResultIndex;
}

- (void)setOriginalSearchResultIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 0x82u;
  self->_originalSearchResultIndex = a3;
}

- (void)setHasOriginalSearchResultIndex:(BOOL)a3
{
  if (a3) {
    char v3 = -126;
  }
  else {
    char v3 = 0x80;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasOriginalSearchResultIndex
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (unsigned)correctedSearchResultIndex
{
  return self->_correctedSearchResultIndex;
}

- (void)setCorrectedSearchResultIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 0x81u;
  self->_correctedSearchResultIndex = a3;
}

- (void)setHasCorrectedSearchResultIndex:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasCorrectedSearchResultIndex
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)_readPreferredSearchDisplayLocation
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPCorrectedSearchReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPreferredSearchDisplayLocation_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasPreferredSearchDisplayLocation
{
  return self->_preferredSearchDisplayLocation != 0;
}

- (NSString)preferredSearchDisplayLocation
{
  -[GEORPCorrectedSearch _readPreferredSearchDisplayLocation]((uint64_t)self);
  preferredSearchDisplayLocation = self->_preferredSearchDisplayLocation;

  return preferredSearchDisplayLocation;
}

- (void)setPreferredSearchDisplayLocation:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_preferredSearchDisplayLocation, a3);
}

- (void)_readPlaceRequest
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPCorrectedSearchReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceRequest_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasPlaceRequest
{
  return self->_placeRequest != 0;
}

- (GEOPDPlaceRequest)placeRequest
{
  -[GEORPCorrectedSearch _readPlaceRequest]((uint64_t)self);
  placeRequest = self->_placeRequest;

  return placeRequest;
}

- (void)setPlaceRequest:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x84u;
  objc_storeStrong((id *)&self->_placeRequest, a3);
}

- (void)_readPlaceResponse
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPCorrectedSearchReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceResponse_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasPlaceResponse
{
  return self->_placeResponse != 0;
}

- (GEOPDPlaceResponse)placeResponse
{
  -[GEORPCorrectedSearch _readPlaceResponse]((uint64_t)self);
  placeResponse = self->_placeResponse;

  return placeResponse;
}

- (void)setPlaceResponse:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x88u;
  objc_storeStrong((id *)&self->_placeResponse, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPCorrectedSearch;
  v4 = [(GEORPCorrectedSearch *)&v8 description];
  v5 = [(GEORPCorrectedSearch *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPCorrectedSearch _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 placeSearchRequest];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 jsonRepresentation];
        objc_super v8 = @"placeSearchRequest";
      }
      else
      {
        objc_super v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"place_search_request";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = [(id)a1 placeSearchResponse];
    v10 = v9;
    if (v9)
    {
      if (a2)
      {
        v11 = [v9 jsonRepresentation];
        v12 = @"placeSearchResponse";
      }
      else
      {
        v11 = [v9 dictionaryRepresentation];
        v12 = @"place_search_response";
      }
      [v4 setObject:v11 forKey:v12];
    }
    char v13 = *(unsigned char *)(a1 + 76);
    if ((v13 & 2) != 0)
    {
      v14 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 72)];
      if (a2) {
        v15 = @"originalSearchResultIndex";
      }
      else {
        v15 = @"original_search_result_index";
      }
      [v4 setObject:v14 forKey:v15];

      char v13 = *(unsigned char *)(a1 + 76);
    }
    if (v13)
    {
      v16 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 68)];
      if (a2) {
        v17 = @"correctedSearchResultIndex";
      }
      else {
        v17 = @"corrected_search_result_index";
      }
      [v4 setObject:v16 forKey:v17];
    }
    v18 = [(id)a1 preferredSearchDisplayLocation];
    if (v18)
    {
      if (a2) {
        v19 = @"preferredSearchDisplayLocation";
      }
      else {
        v19 = @"preferred_search_display_location";
      }
      [v4 setObject:v18 forKey:v19];
    }

    v20 = [(id)a1 placeRequest];
    v21 = v20;
    if (v20)
    {
      if (a2)
      {
        v22 = [v20 jsonRepresentation];
        v23 = @"placeRequest";
      }
      else
      {
        v22 = [v20 dictionaryRepresentation];
        v23 = @"place_request";
      }
      [v4 setObject:v22 forKey:v23];
    }
    v24 = [(id)a1 placeResponse];
    v25 = v24;
    if (v24)
    {
      if (a2)
      {
        v26 = [v24 jsonRepresentation];
        v27 = @"placeResponse";
      }
      else
      {
        v26 = [v24 dictionaryRepresentation];
        v27 = @"place_response";
      }
      [v4 setObject:v26 forKey:v27];
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
  return -[GEORPCorrectedSearch _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPCorrectedSearch)initWithDictionary:(id)a3
{
  return (GEORPCorrectedSearch *)-[GEORPCorrectedSearch _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"placeSearchRequest";
      }
      else {
        objc_super v6 = @"place_search_request";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEOPlaceSearchRequest alloc];
        if (a3) {
          uint64_t v9 = [(GEOPlaceSearchRequest *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEOPlaceSearchRequest *)v8 initWithDictionary:v7];
        }
        v10 = (void *)v9;
        [a1 setPlaceSearchRequest:v9];
      }
      if (a3) {
        v11 = @"placeSearchResponse";
      }
      else {
        v11 = @"place_search_response";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        char v13 = [GEOPlaceSearchResponse alloc];
        if (a3) {
          uint64_t v14 = [(GEOPlaceSearchResponse *)v13 initWithJSON:v12];
        }
        else {
          uint64_t v14 = [(GEOPlaceSearchResponse *)v13 initWithDictionary:v12];
        }
        v15 = (void *)v14;
        [a1 setPlaceSearchResponse:v14];
      }
      if (a3) {
        v16 = @"originalSearchResultIndex";
      }
      else {
        v16 = @"original_search_result_index";
      }
      v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setOriginalSearchResultIndex:", objc_msgSend(v17, "unsignedIntValue"));
      }

      if (a3) {
        v18 = @"correctedSearchResultIndex";
      }
      else {
        v18 = @"corrected_search_result_index";
      }
      v19 = [v5 objectForKeyedSubscript:v18];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setCorrectedSearchResultIndex:", objc_msgSend(v19, "unsignedIntValue"));
      }

      if (a3) {
        v20 = @"preferredSearchDisplayLocation";
      }
      else {
        v20 = @"preferred_search_display_location";
      }
      v21 = [v5 objectForKeyedSubscript:v20];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v22 = (void *)[v21 copy];
        [a1 setPreferredSearchDisplayLocation:v22];
      }
      if (a3) {
        v23 = @"placeRequest";
      }
      else {
        v23 = @"place_request";
      }
      v24 = [v5 objectForKeyedSubscript:v23];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v25 = [GEOPDPlaceRequest alloc];
        if (a3) {
          uint64_t v26 = [(GEOPDPlaceRequest *)v25 initWithJSON:v24];
        }
        else {
          uint64_t v26 = [(GEOPDPlaceRequest *)v25 initWithDictionary:v24];
        }
        v27 = (void *)v26;
        [a1 setPlaceRequest:v26];
      }
      if (a3) {
        v28 = @"placeResponse";
      }
      else {
        v28 = @"place_response";
      }
      v29 = [v5 objectForKeyedSubscript:v28];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v30 = [GEOPDPlaceResponse alloc];
        if (a3) {
          uint64_t v31 = [(GEOPDPlaceResponse *)v30 initWithJSON:v29];
        }
        else {
          uint64_t v31 = [(GEOPDPlaceResponse *)v30 initWithDictionary:v29];
        }
        v32 = (void *)v31;
        [a1 setPlaceResponse:v31];
      }
    }
  }

  return a1;
}

- (GEORPCorrectedSearch)initWithJSON:(id)a3
{
  return (GEORPCorrectedSearch *)-[GEORPCorrectedSearch _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_528;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_529;
    }
    GEORPCorrectedSearchReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEORPCorrectedSearchCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPCorrectedSearchIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPCorrectedSearchReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPCorrectedSearchIsDirty((uint64_t)self) & 1) == 0)
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
    [(GEORPCorrectedSearch *)self readAll:0];
    if (self->_placeSearchRequest) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_placeSearchResponse) {
      PBDataWriterWriteSubmessage();
    }
    char flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteUint32Field();
      char flags = (char)self->_flags;
    }
    if (flags) {
      PBDataWriterWriteUint32Field();
    }
    if (self->_preferredSearchDisplayLocation) {
      PBDataWriterWriteStringField();
    }
    if (self->_placeRequest) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_placeResponse) {
      PBDataWriterWriteSubmessage();
    }
  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEORPCorrectedSearch _readPlaceRequest]((uint64_t)self);
  if ([(GEOPDPlaceRequest *)self->_placeRequest hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORPCorrectedSearch _readPlaceResponse]((uint64_t)self);
  if ([(GEOPDPlaceResponse *)self->_placeResponse hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORPCorrectedSearch _readPlaceSearchRequest]((uint64_t)self);
  if ([(GEOPlaceSearchRequest *)self->_placeSearchRequest hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORPCorrectedSearch _readPlaceSearchResponse]((uint64_t)self);
  placeSearchResponse = self->_placeSearchResponse;

  return [(GEOPlaceSearchResponse *)placeSearchResponse hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  objc_super v6 = (id *)a3;
  [(GEORPCorrectedSearch *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 14) = self->_readerMarkPos;
  *((_DWORD *)v6 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_placeSearchRequest) {
    objc_msgSend(v6, "setPlaceSearchRequest:");
  }
  if (self->_placeSearchResponse) {
    objc_msgSend(v6, "setPlaceSearchResponse:");
  }
  char flags = (char)self->_flags;
  id v5 = v6;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v6 + 18) = self->_originalSearchResultIndex;
    *((unsigned char *)v6 + 76) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *((_DWORD *)v6 + 17) = self->_correctedSearchResultIndex;
    *((unsigned char *)v6 + 76) |= 1u;
  }
  if (self->_preferredSearchDisplayLocation)
  {
    objc_msgSend(v6, "setPreferredSearchDisplayLocation:");
    id v5 = v6;
  }
  if (self->_placeRequest)
  {
    objc_msgSend(v6, "setPlaceRequest:");
    id v5 = v6;
  }
  if (self->_placeResponse)
  {
    objc_msgSend(v6, "setPlaceResponse:");
    id v5 = v6;
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
    if ((*(unsigned char *)&self->_flags & 0x80000000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORPCorrectedSearchReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPCorrectedSearch *)self readAll:0];
  id v9 = [(GEOPlaceSearchRequest *)self->_placeSearchRequest copyWithZone:a3];
  v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  id v11 = [(GEOPlaceSearchResponse *)self->_placeSearchResponse copyWithZone:a3];
  v12 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v11;

  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_originalSearchResultIndex;
    *(unsigned char *)(v5 + 76) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(_DWORD *)(v5 + 68) = self->_correctedSearchResultIndex;
    *(unsigned char *)(v5 + 76) |= 1u;
  }
  uint64_t v14 = [(NSString *)self->_preferredSearchDisplayLocation copyWithZone:a3];
  v15 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v14;

  id v16 = [(GEOPDPlaceRequest *)self->_placeRequest copyWithZone:a3];
  v17 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v16;

  id v18 = [(GEOPDPlaceResponse *)self->_placeResponse copyWithZone:a3];
  id v8 = *(id *)(v5 + 24);
  *(void *)(v5 + 24) = v18;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  [(GEORPCorrectedSearch *)self readAll:1];
  [v4 readAll:1];
  placeSearchRequest = self->_placeSearchRequest;
  if ((unint64_t)placeSearchRequest | *((void *)v4 + 4))
  {
    if (!-[GEOPlaceSearchRequest isEqual:](placeSearchRequest, "isEqual:")) {
      goto LABEL_22;
    }
  }
  placeSearchResponse = self->_placeSearchResponse;
  if ((unint64_t)placeSearchResponse | *((void *)v4 + 5))
  {
    if (!-[GEOPlaceSearchResponse isEqual:](placeSearchResponse, "isEqual:")) {
      goto LABEL_22;
    }
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 2) == 0 || self->_originalSearchResultIndex != *((_DWORD *)v4 + 18)) {
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 2) != 0)
  {
LABEL_22:
    char v10 = 0;
    goto LABEL_23;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 76) & 1) == 0 || self->_correctedSearchResultIndex != *((_DWORD *)v4 + 17)) {
      goto LABEL_22;
    }
  }
  else if (*((unsigned char *)v4 + 76))
  {
    goto LABEL_22;
  }
  preferredSearchDisplayLocation = self->_preferredSearchDisplayLocation;
  if ((unint64_t)preferredSearchDisplayLocation | *((void *)v4 + 6)
    && !-[NSString isEqual:](preferredSearchDisplayLocation, "isEqual:"))
  {
    goto LABEL_22;
  }
  placeRequest = self->_placeRequest;
  if ((unint64_t)placeRequest | *((void *)v4 + 2))
  {
    if (!-[GEOPDPlaceRequest isEqual:](placeRequest, "isEqual:")) {
      goto LABEL_22;
    }
  }
  placeResponse = self->_placeResponse;
  if ((unint64_t)placeResponse | *((void *)v4 + 3)) {
    char v10 = -[GEOPDPlaceResponse isEqual:](placeResponse, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_23:

  return v10;
}

- (unint64_t)hash
{
  [(GEORPCorrectedSearch *)self readAll:1];
  unint64_t v3 = [(GEOPlaceSearchRequest *)self->_placeSearchRequest hash];
  unint64_t v4 = [(GEOPlaceSearchResponse *)self->_placeSearchResponse hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v5 = 2654435761 * self->_originalSearchResultIndex;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0;
    goto LABEL_6;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_correctedSearchResultIndex;
LABEL_6:
  NSUInteger v7 = v4 ^ v3 ^ v5 ^ v6 ^ [(NSString *)self->_preferredSearchDisplayLocation hash];
  unint64_t v8 = [(GEOPDPlaceRequest *)self->_placeRequest hash];
  return v7 ^ v8 ^ [(GEOPDPlaceResponse *)self->_placeResponse hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v14 = a3;
  [v14 readAll:0];
  unint64_t v4 = v14;
  placeSearchRequest = self->_placeSearchRequest;
  uint64_t v6 = v14[4];
  if (placeSearchRequest)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEOPlaceSearchRequest mergeFrom:](placeSearchRequest, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEORPCorrectedSearch setPlaceSearchRequest:](self, "setPlaceSearchRequest:");
  }
  unint64_t v4 = v14;
LABEL_7:
  placeSearchResponse = self->_placeSearchResponse;
  uint64_t v8 = v4[5];
  if (placeSearchResponse)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[GEOPlaceSearchResponse mergeFrom:](placeSearchResponse, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[GEORPCorrectedSearch setPlaceSearchResponse:](self, "setPlaceSearchResponse:");
  }
  unint64_t v4 = v14;
LABEL_13:
  char v9 = *((unsigned char *)v4 + 76);
  if ((v9 & 2) != 0)
  {
    self->_originalSearchResultIndex = *((_DWORD *)v4 + 18);
    *(unsigned char *)&self->_flags |= 2u;
    char v9 = *((unsigned char *)v4 + 76);
  }
  if (v9)
  {
    self->_correctedSearchResultIndex = *((_DWORD *)v4 + 17);
    *(unsigned char *)&self->_flags |= 1u;
  }
  if (v4[6])
  {
    -[GEORPCorrectedSearch setPreferredSearchDisplayLocation:](self, "setPreferredSearchDisplayLocation:");
    unint64_t v4 = v14;
  }
  placeRequest = self->_placeRequest;
  uint64_t v11 = v4[2];
  if (placeRequest)
  {
    if (!v11) {
      goto LABEL_25;
    }
    -[GEOPDPlaceRequest mergeFrom:](placeRequest, "mergeFrom:");
  }
  else
  {
    if (!v11) {
      goto LABEL_25;
    }
    -[GEORPCorrectedSearch setPlaceRequest:](self, "setPlaceRequest:");
  }
  unint64_t v4 = v14;
LABEL_25:
  placeResponse = self->_placeResponse;
  uint64_t v13 = v4[3];
  if (placeResponse)
  {
    if (!v13) {
      goto LABEL_31;
    }
    -[GEOPDPlaceResponse mergeFrom:](placeResponse, "mergeFrom:");
  }
  else
  {
    if (!v13) {
      goto LABEL_31;
    }
    -[GEORPCorrectedSearch setPlaceResponse:](self, "setPlaceResponse:");
  }
  unint64_t v4 = v14;
LABEL_31:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredSearchDisplayLocation, 0);
  objc_storeStrong((id *)&self->_placeSearchResponse, 0);
  objc_storeStrong((id *)&self->_placeSearchRequest, 0);
  objc_storeStrong((id *)&self->_placeResponse, 0);
  objc_storeStrong((id *)&self->_placeRequest, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (BOOL)containsReportableData
{
  unint64_t v3 = [(GEORPCorrectedSearch *)self placeSearchRequest];
  if (v3)
  {
    unint64_t v4 = [(GEORPCorrectedSearch *)self placeSearchResponse];
    if (v4)
    {
      BOOL v5 = 1;
LABEL_9:

      goto LABEL_10;
    }
  }
  uint64_t v6 = [(GEORPCorrectedSearch *)self placeRequest];
  if (v6)
  {
    NSUInteger v7 = [(GEORPCorrectedSearch *)self placeResponse];
    BOOL v5 = v7 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  if (v3)
  {
    unint64_t v4 = 0;
    goto LABEL_9;
  }
LABEL_10:

  return v5;
}

@end