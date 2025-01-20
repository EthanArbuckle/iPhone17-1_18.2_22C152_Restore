@interface GEOPDIpGeoLookupResult
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDIpGeoLookupResult)init;
- (GEOPDIpGeoLookupResult)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)countryCode;
- (id)description;
- (id)dictionaryRepresentation;
- (id)ipAddress;
- (id)jsonRepresentation;
- (id)location;
- (id)timeZome;
- (unint64_t)hash;
- (void)_readCountryCode;
- (void)_readIpAddress;
- (void)_readLocation;
- (void)_readTimeZome;
- (void)readAll:(uint64_t)a1;
- (void)setCountryCode:(uint64_t)a1;
- (void)setIpAddress:(uint64_t)a1;
- (void)setLocation:(uint64_t)a1;
- (void)setTimeZome:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDIpGeoLookupResult

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_45;
  }
  -[GEOPDIpGeoLookupResult readAll:](a1, 1);
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)(a1 + 72))
  {
    int v5 = *(_DWORD *)(a1 + 68);
    if (v5 <= 29)
    {
      v6 = @"STATUS_SUCCESS";
      switch(v5)
      {
        case 0:
          goto LABEL_20;
        case 1:
          v6 = @"STATUS_FAILED";
          break;
        case 2:
          v6 = @"STATUS_INCOMPLETE";
          break;
        case 3:
        case 4:
          goto LABEL_15;
        case 5:
          v6 = @"INVALID_REQUEST";
          break;
        default:
          if (v5 != 20) {
            goto LABEL_15;
          }
          v6 = @"FAILED_NO_RESULT";
          break;
      }
      goto LABEL_20;
    }
    if (v5 > 49)
    {
      if (v5 == 50)
      {
        v6 = @"STATUS_DEDUPED";
        goto LABEL_20;
      }
      if (v5 == 60)
      {
        v6 = @"VERSION_MISMATCH";
        goto LABEL_20;
      }
    }
    else
    {
      if (v5 == 30)
      {
        v6 = @"NEEDS_REFINEMENT";
        goto LABEL_20;
      }
      if (v5 == 40)
      {
        v6 = @"FAILED_NOT_AUTHORIZED";
LABEL_20:
        [v4 setObject:v6 forKey:@"status"];

        goto LABEL_21;
      }
    }
LABEL_15:
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 68));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
LABEL_21:
  v7 = -[GEOPDIpGeoLookupResult ipAddress]((id *)a1);
  if (v7)
  {
    if (a2) {
      v8 = @"ipAddress";
    }
    else {
      v8 = @"ip_address";
    }
    [v4 setObject:v7 forKey:v8];
  }

  v9 = -[GEOPDIpGeoLookupResult location]((id *)a1);
  v10 = v9;
  if (v9)
  {
    if (a2) {
      [v9 jsonRepresentation];
    }
    else {
    v11 = [v9 dictionaryRepresentation];
    }
    [v4 setObject:v11 forKey:@"location"];
  }
  v12 = -[GEOPDIpGeoLookupResult countryCode]((id *)a1);
  if (v12)
  {
    if (a2) {
      v13 = @"countryCode";
    }
    else {
      v13 = @"country_code";
    }
    [v4 setObject:v12 forKey:v13];
  }

  v14 = -[GEOPDIpGeoLookupResult timeZome]((id *)a1);
  if (v14)
  {
    if (a2) {
      v15 = @"timeZome";
    }
    else {
      v15 = @"time_zome";
    }
    [v4 setObject:v14 forKey:v15];
  }

  v16 = *(void **)(a1 + 16);
  if (v16)
  {
    v17 = [v16 dictionaryRepresentation];
    v18 = v17;
    if (a2)
    {
      v19 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v17, "count"));
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __52__GEOPDIpGeoLookupResult__dictionaryRepresentation___block_invoke;
      v23[3] = &unk_1E53D8860;
      id v20 = v19;
      id v24 = v20;
      [v18 enumerateKeysAndObjectsUsingBlock:v23];
      id v21 = v20;

      v18 = v21;
    }
    [v4 setObject:v18 forKey:@"Unknown Fields"];
  }
LABEL_45:

  return v4;
}

- (GEOPDIpGeoLookupResult)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDIpGeoLookupResult;
  v2 = [(GEOPDIpGeoLookupResult *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDIpGeoLookupResult)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDIpGeoLookupResult;
  v3 = [(GEOPDIpGeoLookupResult *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    int v5 = v3;
  }

  return v4;
}

- (void)_readIpAddress
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDIpGeoLookupResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIpAddress_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)ipAddress
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDIpGeoLookupResult _readIpAddress]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setIpAddress:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 72) |= 8u;
  *(unsigned char *)(a1 + 72) |= 0x40u;
  objc_storeStrong((id *)(a1 + 32), a2);
}

- (void)_readLocation
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDIpGeoLookupResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocation_tags_3437);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)location
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDIpGeoLookupResult _readLocation]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setLocation:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 72) |= 0x10u;
  *(unsigned char *)(a1 + 72) |= 0x40u;
  objc_storeStrong((id *)(a1 + 40), a2);
}

- (void)_readCountryCode
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDIpGeoLookupResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCountryCode_tags_3438);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)countryCode
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDIpGeoLookupResult _readCountryCode]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setCountryCode:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 72) |= 4u;
  *(unsigned char *)(a1 + 72) |= 0x40u;
  objc_storeStrong((id *)(a1 + 24), a2);
}

- (void)_readTimeZome
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDIpGeoLookupResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTimeZome_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)timeZome
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDIpGeoLookupResult _readTimeZome]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setTimeZome:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 72) |= 0x20u;
  *(unsigned char *)(a1 + 72) |= 0x40u;
  objc_storeStrong((id *)(a1 + 48), a2);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDIpGeoLookupResult;
  id v4 = [(GEOPDIpGeoLookupResult *)&v8 description];
  int v5 = [(GEOPDIpGeoLookupResult *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDIpGeoLookupResult _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)jsonRepresentation
{
  return -[GEOPDIpGeoLookupResult _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_3445;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_3446;
      }
      GEOPDIpGeoLookupResultReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      [*(id *)(a1 + 40) readAll:1];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __52__GEOPDIpGeoLookupResult__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDIpGeoLookupResultReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x7C) == 0))
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
    -[GEOPDIpGeoLookupResult readAll:]((uint64_t)self, 0);
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    id v5 = v8;
    if (self->_ipAddress)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_location)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_countryCode)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_timeZome)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
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
    if ((*(unsigned char *)&self->_flags & 0x40) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDIpGeoLookupResultReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDIpGeoLookupResult readAll:]((uint64_t)self, 0);
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 68) = self->_status;
    *(unsigned char *)(v5 + 72) |= 1u;
  }
  uint64_t v9 = [(NSString *)self->_ipAddress copyWithZone:a3];
  id v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  id v11 = [(GEOLatLng *)self->_location copyWithZone:a3];
  v12 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v11;

  uint64_t v13 = [(NSString *)self->_countryCode copyWithZone:a3];
  v14 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v13;

  uint64_t v15 = [(NSString *)self->_timeZome copyWithZone:a3];
  v16 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v15;

  v17 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v17;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  -[GEOPDIpGeoLookupResult readAll:]((uint64_t)self, 1);
  -[GEOPDIpGeoLookupResult readAll:]((uint64_t)v4, 1);
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 72) & 1) == 0 || self->_status != *((_DWORD *)v4 + 17)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 72))
  {
LABEL_15:
    char v9 = 0;
    goto LABEL_16;
  }
  ipAddress = self->_ipAddress;
  if ((unint64_t)ipAddress | *((void *)v4 + 4) && !-[NSString isEqual:](ipAddress, "isEqual:")) {
    goto LABEL_15;
  }
  location = self->_location;
  if ((unint64_t)location | *((void *)v4 + 5))
  {
    if (!-[GEOLatLng isEqual:](location, "isEqual:")) {
      goto LABEL_15;
    }
  }
  countryCode = self->_countryCode;
  if ((unint64_t)countryCode | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](countryCode, "isEqual:")) {
      goto LABEL_15;
    }
  }
  timeZome = self->_timeZome;
  if ((unint64_t)timeZome | *((void *)v4 + 6)) {
    char v9 = -[NSString isEqual:](timeZome, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  -[GEOPDIpGeoLookupResult readAll:]((uint64_t)self, 1);
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_status;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_ipAddress hash] ^ v3;
  unint64_t v5 = [(GEOLatLng *)self->_location hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_countryCode hash];
  return v6 ^ [(NSString *)self->_timeZome hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZome, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_ipAddress, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end