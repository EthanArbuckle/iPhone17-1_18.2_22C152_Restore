@interface GEOPDAddressRecommendationParameters
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDAddressRecommendationParameters)init;
- (GEOPDAddressRecommendationParameters)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)readAll:(uint64_t)a1;
- (void)setAddressWithComponents:(uint64_t)a1;
- (void)setCountryOrRegion:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDAddressRecommendationParameters

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        v6 = (int *)&readAll__recursiveTag_113_0;
      }
      else {
        v6 = (int *)&readAll__nonRecursiveTag_114_0;
      }
      GEOPDAddressRecommendationParametersReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      -[GEOPDAddressWithComponents readAll:](*(void *)(a1 + 24), 1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDAddressRecommendationParametersIsDirty((uint64_t)self) & 1) == 0)
  {
    v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDAddressRecommendationParameters readAll:]((uint64_t)self, 0);
    if (self->_countryOrRegion) {
      PBDataWriterWriteStringField();
    }
    id v5 = v8;
    if (self->_addressWithComponents)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)setCountryOrRegion:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 52) |= 4u;
  *(unsigned char *)(a1 + 52) |= 8u;
  objc_storeStrong((id *)(a1 + 32), a2);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDAddressRecommendationParameters readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 4) == 0)
    {
      id v5 = *(void **)(a1 + 8);
      if (v5)
      {
        id v6 = v5;
        objc_sync_enter(v6);
        GEOPDAddressRecommendationParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCountryOrRegion_tags);
        objc_sync_exit(v6);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    id v7 = *(id *)(a1 + 32);
    if (v7)
    {
      if (a2) {
        id v8 = @"countryOrRegion";
      }
      else {
        id v8 = @"country_or_region";
      }
      [v4 setObject:v7 forKey:v8];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 2) == 0)
    {
      v9 = *(void **)(a1 + 8);
      if (v9)
      {
        id v10 = v9;
        objc_sync_enter(v10);
        GEOPDAddressRecommendationParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAddressWithComponents_tags);
        objc_sync_exit(v10);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    id v11 = *(id *)(a1 + 24);
    v12 = v11;
    if (v11)
    {
      if (a2)
      {
        v13 = [v11 jsonRepresentation];
        v14 = @"addressWithComponents";
      }
      else
      {
        v13 = [v11 dictionaryRepresentation];
        v14 = @"address_with_components";
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
        v22[2] = __66__GEOPDAddressRecommendationParameters__dictionaryRepresentation___block_invoke;
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
    id v4 = 0;
  }

  return v4;
}

- (GEOPDAddressRecommendationParameters)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDAddressRecommendationParameters;
  v2 = [(GEOPDAddressRecommendationParameters *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (GEOPDAddressRecommendationParameters)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDAddressRecommendationParameters;
  v3 = [(GEOPDAddressRecommendationParameters *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)setAddressWithComponents:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 52) |= 2u;
  *(unsigned char *)(a1 + 52) |= 8u;
  objc_storeStrong((id *)(a1 + 24), a2);
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDAddressRecommendationParameters;
  id v4 = [(GEOPDAddressRecommendationParameters *)&v8 description];
  id v5 = [(GEOPDAddressRecommendationParameters *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAddressRecommendationParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)jsonRepresentation
{
  return -[GEOPDAddressRecommendationParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __66__GEOPDAddressRecommendationParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDAddressRecommendationParametersReadAllFrom((uint64_t)self, a3, 0);
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
    -[GEOPDAddressRecommendationParameters readAll:]((uint64_t)self, 0);
    uint64_t v8 = [(NSString *)self->_countryOrRegion copyWithZone:a3];
    v9 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v8;

    id v10 = [(GEOPDAddressWithComponents *)self->_addressWithComponents copyWithZone:a3];
    id v11 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v10;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPDAddressRecommendationParametersReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOPDAddressRecommendationParameters readAll:]((uint64_t)self, 1),
         -[GEOPDAddressRecommendationParameters readAll:]((uint64_t)v4, 1),
         countryOrRegion = self->_countryOrRegion,
         !((unint64_t)countryOrRegion | v4[4]))
     || -[NSString isEqual:](countryOrRegion, "isEqual:")))
  {
    addressWithComponents = self->_addressWithComponents;
    if ((unint64_t)addressWithComponents | v4[3]) {
      char v7 = -[GEOPDAddressWithComponents isEqual:](addressWithComponents, "isEqual:");
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
  -[GEOPDAddressRecommendationParameters readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_countryOrRegion hash];
  return [(GEOPDAddressWithComponents *)self->_addressWithComponents hash] ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryOrRegion, 0);
  objc_storeStrong((id *)&self->_addressWithComponents, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end