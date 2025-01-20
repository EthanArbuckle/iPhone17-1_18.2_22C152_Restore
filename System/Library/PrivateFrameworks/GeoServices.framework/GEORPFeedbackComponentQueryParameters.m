@interface GEORPFeedbackComponentQueryParameters
+ (BOOL)isValid:(id)a3;
- (BOOL)hasPoiEnrichmentQueryParameters;
- (BOOL)hasRapQueryParameters;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPFeedbackComponentQueryParameters)init;
- (GEORPFeedbackComponentQueryParameters)initWithData:(id)a3;
- (GEORPFeedbackComponentQueryParameters)initWithDictionary:(id)a3;
- (GEORPFeedbackComponentQueryParameters)initWithJSON:(id)a3;
- (GEORPPoiEnrichmentQueryParameters)poiEnrichmentQueryParameters;
- (GEORPRapQueryParameters)rapQueryParameters;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readPoiEnrichmentQueryParameters;
- (void)_readRapQueryParameters;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setPoiEnrichmentQueryParameters:(id)a3;
- (void)setRapQueryParameters:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPFeedbackComponentQueryParameters

- (GEORPFeedbackComponentQueryParameters)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackComponentQueryParameters;
  v2 = [(GEORPFeedbackComponentQueryParameters *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackComponentQueryParameters)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackComponentQueryParameters;
  v3 = [(GEORPFeedbackComponentQueryParameters *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readPoiEnrichmentQueryParameters
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
        GEORPFeedbackComponentQueryParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPoiEnrichmentQueryParameters_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasPoiEnrichmentQueryParameters
{
  return self->_poiEnrichmentQueryParameters != 0;
}

- (GEORPPoiEnrichmentQueryParameters)poiEnrichmentQueryParameters
{
  -[GEORPFeedbackComponentQueryParameters _readPoiEnrichmentQueryParameters]((uint64_t)self);
  poiEnrichmentQueryParameters = self->_poiEnrichmentQueryParameters;

  return poiEnrichmentQueryParameters;
}

- (void)setPoiEnrichmentQueryParameters:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xAu;
  objc_storeStrong((id *)&self->_poiEnrichmentQueryParameters, a3);
}

- (void)_readRapQueryParameters
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
        GEORPFeedbackComponentQueryParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRapQueryParameters_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasRapQueryParameters
{
  return self->_rapQueryParameters != 0;
}

- (GEORPRapQueryParameters)rapQueryParameters
{
  -[GEORPFeedbackComponentQueryParameters _readRapQueryParameters]((uint64_t)self);
  rapQueryParameters = self->_rapQueryParameters;

  return rapQueryParameters;
}

- (void)setRapQueryParameters:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_rapQueryParameters, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPFeedbackComponentQueryParameters;
  v4 = [(GEORPFeedbackComponentQueryParameters *)&v8 description];
  v5 = [(GEORPFeedbackComponentQueryParameters *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackComponentQueryParameters _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 poiEnrichmentQueryParameters];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 jsonRepresentation];
        objc_super v8 = @"poiEnrichmentQueryParameters";
      }
      else
      {
        objc_super v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"poi_enrichment_query_parameters";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = [a1 rapQueryParameters];
    v10 = v9;
    if (v9)
    {
      if (a2)
      {
        v11 = [v9 jsonRepresentation];
        v12 = @"rapQueryParameters";
      }
      else
      {
        v11 = [v9 dictionaryRepresentation];
        v12 = @"rap_query_parameters";
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
        v20[2] = __67__GEORPFeedbackComponentQueryParameters__dictionaryRepresentation___block_invoke;
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
  return -[GEORPFeedbackComponentQueryParameters _dictionaryRepresentation:](self, 1);
}

void __67__GEORPFeedbackComponentQueryParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPFeedbackComponentQueryParameters)initWithDictionary:(id)a3
{
  return (GEORPFeedbackComponentQueryParameters *)-[GEORPFeedbackComponentQueryParameters _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"poiEnrichmentQueryParameters";
      }
      else {
        objc_super v6 = @"poi_enrichment_query_parameters";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEORPPoiEnrichmentQueryParameters alloc];
        if (a3) {
          uint64_t v9 = [(GEORPPoiEnrichmentQueryParameters *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEORPPoiEnrichmentQueryParameters *)v8 initWithDictionary:v7];
        }
        id v10 = (void *)v9;
        [a1 setPoiEnrichmentQueryParameters:v9];
      }
      if (a3) {
        v11 = @"rapQueryParameters";
      }
      else {
        v11 = @"rap_query_parameters";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = [GEORPRapQueryParameters alloc];
        if (a3) {
          uint64_t v14 = [(GEORPRapQueryParameters *)v13 initWithJSON:v12];
        }
        else {
          uint64_t v14 = [(GEORPRapQueryParameters *)v13 initWithDictionary:v12];
        }
        v15 = (void *)v14;
        [a1 setRapQueryParameters:v14];
      }
    }
  }

  return a1;
}

- (GEORPFeedbackComponentQueryParameters)initWithJSON:(id)a3
{
  return (GEORPFeedbackComponentQueryParameters *)-[GEORPFeedbackComponentQueryParameters _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_224;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_225;
    }
    GEORPFeedbackComponentQueryParametersReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEORPPoiEnrichmentQueryParameters *)self->_poiEnrichmentQueryParameters readAll:1];
    [(GEORPRapQueryParameters *)self->_rapQueryParameters readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackComponentQueryParametersIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackComponentQueryParametersReadAllFrom((uint64_t)self, a3, 0);
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
    [(GEORPFeedbackComponentQueryParameters *)self readAll:0];
    if (self->_poiEnrichmentQueryParameters) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v8;
    if (self->_rapQueryParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)copyTo:(id)a3
{
  v4 = (id *)a3;
  [(GEORPFeedbackComponentQueryParameters *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 10) = self->_readerMarkPos;
  *((_DWORD *)v4 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_poiEnrichmentQueryParameters) {
    objc_msgSend(v4, "setPoiEnrichmentQueryParameters:");
  }
  if (self->_rapQueryParameters) {
    objc_msgSend(v4, "setRapQueryParameters:");
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
    [(GEORPFeedbackComponentQueryParameters *)self readAll:0];
    id v8 = [(GEORPPoiEnrichmentQueryParameters *)self->_poiEnrichmentQueryParameters copyWithZone:a3];
    uint64_t v9 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v8;

    id v10 = [(GEORPRapQueryParameters *)self->_rapQueryParameters copyWithZone:a3];
    v11 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v10;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEORPFeedbackComponentQueryParametersReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEORPFeedbackComponentQueryParameters *)self readAll:1],
         [v4 readAll:1],
         poiEnrichmentQueryParameters = self->_poiEnrichmentQueryParameters,
         !((unint64_t)poiEnrichmentQueryParameters | v4[3]))
     || -[GEORPPoiEnrichmentQueryParameters isEqual:](poiEnrichmentQueryParameters, "isEqual:")))
  {
    rapQueryParameters = self->_rapQueryParameters;
    if ((unint64_t)rapQueryParameters | v4[4]) {
      char v7 = -[GEORPRapQueryParameters isEqual:](rapQueryParameters, "isEqual:");
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
  [(GEORPFeedbackComponentQueryParameters *)self readAll:1];
  unint64_t v3 = [(GEORPPoiEnrichmentQueryParameters *)self->_poiEnrichmentQueryParameters hash];
  return [(GEORPRapQueryParameters *)self->_rapQueryParameters hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v8 = a3;
  [v8 readAll:0];
  poiEnrichmentQueryParameters = self->_poiEnrichmentQueryParameters;
  uint64_t v5 = v8[3];
  if (poiEnrichmentQueryParameters)
  {
    if (v5) {
      -[GEORPPoiEnrichmentQueryParameters mergeFrom:](poiEnrichmentQueryParameters, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEORPFeedbackComponentQueryParameters setPoiEnrichmentQueryParameters:](self, "setPoiEnrichmentQueryParameters:");
  }
  rapQueryParameters = self->_rapQueryParameters;
  uint64_t v7 = v8[4];
  if (rapQueryParameters)
  {
    if (v7) {
      -[GEORPRapQueryParameters mergeFrom:](rapQueryParameters, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[GEORPFeedbackComponentQueryParameters setRapQueryParameters:](self, "setRapQueryParameters:");
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
      GEORPFeedbackComponentQueryParametersReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_229);
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
    [(GEORPFeedbackComponentQueryParameters *)self readAll:0];
    [(GEORPPoiEnrichmentQueryParameters *)self->_poiEnrichmentQueryParameters clearUnknownFields:1];
    rapQueryParameters = self->_rapQueryParameters;
    [(GEORPRapQueryParameters *)rapQueryParameters clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rapQueryParameters, 0);
  objc_storeStrong((id *)&self->_poiEnrichmentQueryParameters, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end