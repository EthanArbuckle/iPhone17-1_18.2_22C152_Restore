@interface GEORouteHypothesisResponse
+ (BOOL)isValid:(id)a3;
- (BOOL)hasDirectionsResponse;
- (BOOL)hasEtaResponse;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasUpdatedTimeStamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEODirectionsResponse)directionsResponse;
- (GEOETAResponse)etaResponse;
- (GEORouteHypothesisResponse)init;
- (GEORouteHypothesisResponse)initWithData:(id)a3;
- (GEORouteHypothesisResponse)initWithDictionary:(id)a3;
- (GEORouteHypothesisResponse)initWithJSON:(id)a3;
- (double)updatedTimeStamp;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readDirectionsResponse;
- (void)_readEtaResponse;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setDirectionsResponse:(id)a3;
- (void)setEtaResponse:(id)a3;
- (void)setHasUpdatedTimeStamp:(BOOL)a3;
- (void)setUpdatedTimeStamp:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORouteHypothesisResponse

- (GEORouteHypothesisResponse)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORouteHypothesisResponse;
  v2 = [(GEORouteHypothesisResponse *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORouteHypothesisResponse)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORouteHypothesisResponse;
  v3 = [(GEORouteHypothesisResponse *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readDirectionsResponse
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
        GEORouteHypothesisResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDirectionsResponse_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasDirectionsResponse
{
  return self->_directionsResponse != 0;
}

- (GEODirectionsResponse)directionsResponse
{
  -[GEORouteHypothesisResponse _readDirectionsResponse]((uint64_t)self);
  directionsResponse = self->_directionsResponse;

  return directionsResponse;
}

- (void)setDirectionsResponse:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xAu;
  objc_storeStrong((id *)&self->_directionsResponse, a3);
}

- (void)_readEtaResponse
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
        GEORouteHypothesisResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEtaResponse_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasEtaResponse
{
  return self->_etaResponse != 0;
}

- (GEOETAResponse)etaResponse
{
  -[GEORouteHypothesisResponse _readEtaResponse]((uint64_t)self);
  etaResponse = self->_etaResponse;

  return etaResponse;
}

- (void)setEtaResponse:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_etaResponse, a3);
}

- (double)updatedTimeStamp
{
  return self->_updatedTimeStamp;
}

- (void)setUpdatedTimeStamp:(double)a3
{
  *(unsigned char *)&self->_flags |= 9u;
  self->_updatedTimeStamp = a3;
}

- (void)setHasUpdatedTimeStamp:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 8;
}

- (BOOL)hasUpdatedTimeStamp
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORouteHypothesisResponse;
  v4 = [(GEORouteHypothesisResponse *)&v8 description];
  v5 = [(GEORouteHypothesisResponse *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORouteHypothesisResponse _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 directionsResponse];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      objc_super v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"directionsResponse"];
    }
    objc_super v8 = [(id)a1 etaResponse];
    v9 = v8;
    if (v8)
    {
      if (a2) {
        [v8 jsonRepresentation];
      }
      else {
      v10 = [v8 dictionaryRepresentation];
      }
      [v4 setObject:v10 forKey:@"etaResponse"];
    }
    if (*(unsigned char *)(a1 + 52))
    {
      v11 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
      [v4 setObject:v11 forKey:@"updatedTimeStamp"];
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
  return -[GEORouteHypothesisResponse _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORouteHypothesisResponse)initWithDictionary:(id)a3
{
  return (GEORouteHypothesisResponse *)-[GEORouteHypothesisResponse _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"directionsResponse"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v7 = [GEODirectionsResponse alloc];
        if (a3) {
          uint64_t v8 = [(GEODirectionsResponse *)v7 initWithJSON:v6];
        }
        else {
          uint64_t v8 = [(GEODirectionsResponse *)v7 initWithDictionary:v6];
        }
        v9 = (void *)v8;
        [a1 setDirectionsResponse:v8];
      }
      v10 = [v5 objectForKeyedSubscript:@"etaResponse"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = [GEOETAResponse alloc];
        if (a3) {
          uint64_t v12 = [(GEOETAResponse *)v11 initWithJSON:v10];
        }
        else {
          uint64_t v12 = [(GEOETAResponse *)v11 initWithDictionary:v10];
        }
        v13 = (void *)v12;
        [a1 setEtaResponse:v12];
      }
      v14 = [v5 objectForKeyedSubscript:@"updatedTimeStamp"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v14 doubleValue];
        objc_msgSend(a1, "setUpdatedTimeStamp:");
      }
    }
  }

  return a1;
}

- (GEORouteHypothesisResponse)initWithJSON:(id)a3
{
  return (GEORouteHypothesisResponse *)-[GEORouteHypothesisResponse _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_23;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_23;
    }
    GEORouteHypothesisResponseReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEODirectionsResponse *)self->_directionsResponse readAll:1];
    [(GEOETAResponse *)self->_etaResponse readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORouteHypothesisResponseIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORouteHypothesisResponseReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORouteHypothesisResponseIsDirty((uint64_t)self) & 1) == 0)
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
    [(GEORouteHypothesisResponse *)self readAll:0];
    if (self->_directionsResponse) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_etaResponse) {
      PBDataWriterWriteSubmessage();
    }
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteDoubleField();
    }
  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEORouteHypothesisResponse _readDirectionsResponse]((uint64_t)self);
  if ([(GEODirectionsResponse *)self->_directionsResponse hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORouteHypothesisResponse _readEtaResponse]((uint64_t)self);
  etaResponse = self->_etaResponse;

  return [(GEOETAResponse *)etaResponse hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  v4 = (id *)a3;
  [(GEORouteHypothesisResponse *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 10) = self->_readerMarkPos;
  *((_DWORD *)v4 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_directionsResponse) {
    objc_msgSend(v4, "setDirectionsResponse:");
  }
  if (self->_etaResponse) {
    objc_msgSend(v4, "setEtaResponse:");
  }
  if (*(unsigned char *)&self->_flags)
  {
    v4[4] = *(id *)&self->_updatedTimeStamp;
    *((unsigned char *)v4 + 52) |= 1u;
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
    if ((*(unsigned char *)&self->_flags & 8) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORouteHypothesisResponseReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORouteHypothesisResponse *)self readAll:0];
  id v9 = [(GEODirectionsResponse *)self->_directionsResponse copyWithZone:a3];
  v10 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v9;

  id v11 = [(GEOETAResponse *)self->_etaResponse copyWithZone:a3];
  uint64_t v12 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v11;

  if (*(unsigned char *)&self->_flags)
  {
    *(double *)(v5 + 32) = self->_updatedTimeStamp;
    *(unsigned char *)(v5 + 52) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  [(GEORouteHypothesisResponse *)self readAll:1];
  [v4 readAll:1];
  directionsResponse = self->_directionsResponse;
  if ((unint64_t)directionsResponse | *((void *)v4 + 2))
  {
    if (!-[GEODirectionsResponse isEqual:](directionsResponse, "isEqual:")) {
      goto LABEL_10;
    }
  }
  etaResponse = self->_etaResponse;
  if ((unint64_t)etaResponse | *((void *)v4 + 3))
  {
    if (!-[GEOETAResponse isEqual:](etaResponse, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 52) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 52) & 1) != 0 && self->_updatedTimeStamp == *((double *)v4 + 4))
    {
      BOOL v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    BOOL v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  [(GEORouteHypothesisResponse *)self readAll:1];
  unint64_t v3 = [(GEODirectionsResponse *)self->_directionsResponse hash];
  unint64_t v4 = [(GEOETAResponse *)self->_etaResponse hash];
  if (*(unsigned char *)&self->_flags)
  {
    double updatedTimeStamp = self->_updatedTimeStamp;
    double v7 = -updatedTimeStamp;
    if (updatedTimeStamp >= 0.0) {
      double v7 = self->_updatedTimeStamp;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  double v9 = a3;
  [v9 readAll:0];
  unint64_t v4 = v9;
  directionsResponse = self->_directionsResponse;
  uint64_t v6 = v9[2];
  if (directionsResponse)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEODirectionsResponse mergeFrom:](directionsResponse, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEORouteHypothesisResponse setDirectionsResponse:](self, "setDirectionsResponse:");
  }
  unint64_t v4 = v9;
LABEL_7:
  etaResponse = self->_etaResponse;
  uint64_t v8 = v4[3];
  if (etaResponse)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[GEOETAResponse mergeFrom:](etaResponse, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[GEORouteHypothesisResponse setEtaResponse:](self, "setEtaResponse:");
  }
  unint64_t v4 = v9;
LABEL_13:
  if (*((unsigned char *)v4 + 52))
  {
    self->_double updatedTimeStamp = (double)v4[4];
    *(unsigned char *)&self->_flags |= 1u;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_etaResponse, 0);
  objc_storeStrong((id *)&self->_directionsResponse, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end