@interface GEORPLocalityFeedback
+ (BOOL)isValid:(id)a3;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasPlace;
- (BOOL)hasPlaceRequest;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDPlace)place;
- (GEOPDPlaceRequest)placeRequest;
- (GEORPLocalityFeedback)init;
- (GEORPLocalityFeedback)initWithData:(id)a3;
- (GEORPLocalityFeedback)initWithDictionary:(id)a3;
- (GEORPLocalityFeedback)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readPlace;
- (void)_readPlaceRequest;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setPlace:(id)a3;
- (void)setPlaceRequest:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPLocalityFeedback

- (GEORPLocalityFeedback)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPLocalityFeedback;
  v2 = [(GEORPLocalityFeedback *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPLocalityFeedback)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPLocalityFeedback;
  v3 = [(GEORPLocalityFeedback *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readPlace
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
        GEORPLocalityFeedbackReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlace_tags_2750);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasPlace
{
  return self->_place != 0;
}

- (GEOPDPlace)place
{
  -[GEORPLocalityFeedback _readPlace]((uint64_t)self);
  place = self->_place;

  return place;
}

- (void)setPlace:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_place, a3);
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
        GEORPLocalityFeedbackReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceRequest_tags_2751);
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
  -[GEORPLocalityFeedback _readPlaceRequest]((uint64_t)self);
  placeRequest = self->_placeRequest;

  return placeRequest;
}

- (void)setPlaceRequest:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xAu;
  objc_storeStrong((id *)&self->_placeRequest, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPLocalityFeedback;
  v4 = [(GEORPLocalityFeedback *)&v8 description];
  v5 = [(GEORPLocalityFeedback *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPLocalityFeedback _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 place];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      objc_super v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"place"];
    }
    objc_super v8 = [a1 placeRequest];
    v9 = v8;
    if (v8)
    {
      if (a2)
      {
        v10 = [v8 jsonRepresentation];
        v11 = @"placeRequest";
      }
      else
      {
        v10 = [v8 dictionaryRepresentation];
        v11 = @"place_request";
      }
      [v4 setObject:v10 forKey:v11];
    }
    v12 = (void *)a1[2];
    if (v12)
    {
      v13 = [v12 dictionaryRepresentation];
      v14 = v13;
      if (a2)
      {
        v15 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __51__GEORPLocalityFeedback__dictionaryRepresentation___block_invoke;
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
  return -[GEORPLocalityFeedback _dictionaryRepresentation:](self, 1);
}

void __51__GEORPLocalityFeedback__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPLocalityFeedback)initWithDictionary:(id)a3
{
  return (GEORPLocalityFeedback *)-[GEORPLocalityFeedback _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"place"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v7 = [GEOPDPlace alloc];
        if (a3) {
          uint64_t v8 = [(GEOPDPlace *)v7 initWithJSON:v6];
        }
        else {
          uint64_t v8 = [(GEOPDPlace *)v7 initWithDictionary:v6];
        }
        v9 = (void *)v8;
        [a1 setPlace:v8];
      }
      if (a3) {
        id v10 = @"placeRequest";
      }
      else {
        id v10 = @"place_request";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v12 = [GEOPDPlaceRequest alloc];
        if (a3) {
          uint64_t v13 = [(GEOPDPlaceRequest *)v12 initWithJSON:v11];
        }
        else {
          uint64_t v13 = [(GEOPDPlaceRequest *)v12 initWithDictionary:v11];
        }
        v14 = (void *)v13;
        [a1 setPlaceRequest:v13];
      }
    }
  }

  return a1;
}

- (GEORPLocalityFeedback)initWithJSON:(id)a3
{
  return (GEORPLocalityFeedback *)-[GEORPLocalityFeedback _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_2752;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_2753;
    }
    GEORPLocalityFeedbackReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEOPDPlace *)self->_place readAll:1];
    [(GEOPDPlaceRequest *)self->_placeRequest readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPLocalityFeedbackIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPLocalityFeedbackReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPLocalityFeedbackIsDirty((uint64_t)self) & 1) == 0)
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
    [(GEORPLocalityFeedback *)self readAll:0];
    if (self->_place) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v8;
    if (self->_placeRequest)
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
  -[GEORPLocalityFeedback _readPlace]((uint64_t)self);
  if ([(GEOPDPlace *)self->_place hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORPLocalityFeedback _readPlaceRequest]((uint64_t)self);
  placeRequest = self->_placeRequest;

  return [(GEOPDPlaceRequest *)placeRequest hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  v4 = (id *)a3;
  [(GEORPLocalityFeedback *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 10) = self->_readerMarkPos;
  *((_DWORD *)v4 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_place) {
    objc_msgSend(v4, "setPlace:");
  }
  if (self->_placeRequest) {
    objc_msgSend(v4, "setPlaceRequest:");
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
    [(GEORPLocalityFeedback *)self readAll:0];
    id v8 = [(GEOPDPlace *)self->_place copyWithZone:a3];
    v9 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v8;

    id v10 = [(GEOPDPlaceRequest *)self->_placeRequest copyWithZone:a3];
    v11 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v10;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEORPLocalityFeedbackReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEORPLocalityFeedback *)self readAll:1],
         [v4 readAll:1],
         place = self->_place,
         !((unint64_t)place | v4[4]))
     || -[GEOPDPlace isEqual:](place, "isEqual:")))
  {
    placeRequest = self->_placeRequest;
    if ((unint64_t)placeRequest | v4[3]) {
      char v7 = -[GEOPDPlaceRequest isEqual:](placeRequest, "isEqual:");
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
  [(GEORPLocalityFeedback *)self readAll:1];
  unint64_t v3 = [(GEOPDPlace *)self->_place hash];
  return [(GEOPDPlaceRequest *)self->_placeRequest hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v8 = a3;
  [v8 readAll:0];
  place = self->_place;
  uint64_t v5 = v8[4];
  if (place)
  {
    if (v5) {
      -[GEOPDPlace mergeFrom:](place, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEORPLocalityFeedback setPlace:](self, "setPlace:");
  }
  placeRequest = self->_placeRequest;
  uint64_t v7 = v8[3];
  if (placeRequest)
  {
    if (v7) {
      -[GEOPDPlaceRequest mergeFrom:](placeRequest, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[GEORPLocalityFeedback setPlaceRequest:](self, "setPlaceRequest:");
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
      GEORPLocalityFeedbackReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_2757);
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
    [(GEORPLocalityFeedback *)self readAll:0];
    [(GEOPDPlace *)self->_place clearUnknownFields:1];
    placeRequest = self->_placeRequest;
    [(GEOPDPlaceRequest *)placeRequest clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_place, 0);
  objc_storeStrong((id *)&self->_placeRequest, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end