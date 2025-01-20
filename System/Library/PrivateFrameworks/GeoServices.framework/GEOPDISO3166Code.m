@interface GEOPDISO3166Code
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDISO3166Code)init;
- (GEOPDISO3166Code)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)countryCode;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)location;
- (id)subdivisonCode;
- (unint64_t)hash;
- (void)_readCountryCode;
- (void)_readLocation;
- (void)_readSubdivisonCode;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDISO3166Code

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subdivisonCode, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x3C) == 0))
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
    -[GEOPDISO3166Code readAll:]((uint64_t)self, 0);
    if (self->_location) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v8;
    if (self->_countryCode)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_subdivisonCode)
    {
      PBDataWriterWriteStringField();
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

- (id)subdivisonCode
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDISO3166Code _readSubdivisonCode]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)countryCode
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDISO3166Code _readCountryCode]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readSubdivisonCode
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDISO3166CodeReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSubdivisonCode_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (void)_readCountryCode
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDISO3166CodeReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCountryCode_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDISO3166CodeReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDISO3166Code readAll:]((uint64_t)self, 0);
  id v9 = [(GEOLatLngE7 *)self->_location copyWithZone:a3];
  v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  uint64_t v11 = [(NSString *)self->_countryCode copyWithZone:a3];
  v12 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v11;

  uint64_t v13 = [(NSString *)self->_subdivisonCode copyWithZone:a3];
  v14 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v13;

  if (*(unsigned char *)&self->_flags)
  {
    *(unsigned char *)(v5 + 60) = self->_isDisputed;
    *(unsigned char *)(v5 + 64) |= 1u;
  }
  v15 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v15;
LABEL_8:

  return (id)v5;
}

- (GEOPDISO3166Code)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDISO3166Code;
  v2 = [(GEOPDISO3166Code *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  -[GEOPDISO3166Code readAll:]((uint64_t)self, 1);
  -[GEOPDISO3166Code readAll:]((uint64_t)v4, 1);
  location = self->_location;
  if ((unint64_t)location | *((void *)v4 + 4))
  {
    if (!-[GEOLatLngE7 isEqual:](location, "isEqual:")) {
      goto LABEL_10;
    }
  }
  countryCode = self->_countryCode;
  if ((unint64_t)countryCode | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](countryCode, "isEqual:")) {
      goto LABEL_10;
    }
  }
  subdivisonCode = self->_subdivisonCode;
  if ((unint64_t)subdivisonCode | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](subdivisonCode, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v8 = (*((unsigned char *)v4 + 64) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0)
    {
LABEL_10:
      BOOL v8 = 0;
      goto LABEL_11;
    }
    if (self->_isDisputed)
    {
      if (!*((unsigned char *)v4 + 60)) {
        goto LABEL_10;
      }
    }
    else if (*((unsigned char *)v4 + 60))
    {
      goto LABEL_10;
    }
    BOOL v8 = 1;
  }
LABEL_11:

  return v8;
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_5856;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_5857;
      }
      GEOPDISO3166CodeReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      [*(id *)(a1 + 32) readAll:1];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (GEOPDISO3166Code)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDISO3166Code;
  id v3 = [(GEOPDISO3166Code *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)_readLocation
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDISO3166CodeReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocation_tags_6);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)location
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDISO3166Code _readLocation]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDISO3166Code;
  id v4 = [(GEOPDISO3166Code *)&v8 description];
  id v5 = [(GEOPDISO3166Code *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDISO3166Code _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDISO3166Code readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = -[GEOPDISO3166Code location]((id *)a1);
    objc_super v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      objc_super v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"location"];
    }
    objc_super v8 = -[GEOPDISO3166Code countryCode]((id *)a1);
    if (v8)
    {
      if (a2) {
        id v9 = @"countryCode";
      }
      else {
        id v9 = @"country_code";
      }
      [v4 setObject:v8 forKey:v9];
    }

    v10 = -[GEOPDISO3166Code subdivisonCode]((id *)a1);
    if (v10)
    {
      if (a2) {
        uint64_t v11 = @"subdivisonCode";
      }
      else {
        uint64_t v11 = @"subdivison_code";
      }
      [v4 setObject:v10 forKey:v11];
    }

    if (*(unsigned char *)(a1 + 64))
    {
      v12 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 60)];
      if (a2) {
        uint64_t v13 = @"isDisputed";
      }
      else {
        uint64_t v13 = @"is_disputed";
      }
      [v4 setObject:v12 forKey:v13];
    }
    v14 = *(void **)(a1 + 16);
    if (v14)
    {
      v15 = [v14 dictionaryRepresentation];
      v16 = v15;
      if (a2)
      {
        v17 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __46__GEOPDISO3166Code__dictionaryRepresentation___block_invoke;
        v21[3] = &unk_1E53D8860;
        id v18 = v17;
        id v22 = v18;
        [v16 enumerateKeysAndObjectsUsingBlock:v21];
        id v19 = v18;

        v16 = v19;
      }
      [v4 setObject:v16 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDISO3166Code _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __46__GEOPDISO3166Code__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    id v9 = [v10 description];
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
  return GEOPDISO3166CodeReadAllFrom((uint64_t)self, a3, 0);
}

- (unint64_t)hash
{
  -[GEOPDISO3166Code readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOLatLngE7 *)self->_location hash];
  NSUInteger v4 = [(NSString *)self->_countryCode hash];
  NSUInteger v5 = [(NSString *)self->_subdivisonCode hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v6 = 2654435761 * self->_isDisputed;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

@end