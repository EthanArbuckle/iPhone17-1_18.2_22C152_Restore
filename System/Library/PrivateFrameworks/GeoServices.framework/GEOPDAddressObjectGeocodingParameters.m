@interface GEOPDAddressObjectGeocodingParameters
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDAddressObjectGeocodingParameters)init;
- (GEOPDAddressObjectGeocodingParameters)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_readViewportInfo;
- (void)readAll:(uint64_t)a1;
- (void)setAddressObject:(uint64_t)a1;
- (void)setViewportInfo:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDAddressObjectGeocodingParameters

- (unint64_t)hash
{
  -[GEOPDAddressObjectGeocodingParameters readAll:]((uint64_t)self, 1);
  uint64_t v3 = [(NSData *)self->_addressObject hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v4 = 2654435761 * self->_maxResults;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ [(GEOPDViewportInfo *)self->_viewportInfo hash] ^ v3;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1C) == 0))
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
    -[GEOPDAddressObjectGeocodingParameters readAll:]((uint64_t)self, 0);
    if (self->_addressObject) {
      PBDataWriterWriteDataField();
    }
    id v5 = v8;
    if (*(unsigned char *)&self->_flags)
    {
      PBDataWriterWriteUint32Field();
      id v5 = v8;
    }
    if (self->_viewportInfo)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    uint64_t v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        v6 = (int *)&readAll__recursiveTag_11;
      }
      else {
        v6 = (int *)&readAll__nonRecursiveTag_11;
      }
      GEOPDAddressObjectGeocodingParametersReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      [*(id *)(a1 + 32) readAll:1];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

void __67__GEOPDAddressObjectGeocodingParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    id v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    id v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  -[GEOPDAddressObjectGeocodingParameters readAll:]((uint64_t)self, 1);
  -[GEOPDAddressObjectGeocodingParameters readAll:]((uint64_t)v4, 1);
  addressObject = self->_addressObject;
  if ((unint64_t)addressObject | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](addressObject, "isEqual:")) {
      goto LABEL_11;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_maxResults != *((_DWORD *)v4 + 13)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  viewportInfo = self->_viewportInfo;
  if ((unint64_t)viewportInfo | *((void *)v4 + 4)) {
    char v7 = -[GEOPDViewportInfo isEqual:](viewportInfo, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDAddressObjectGeocodingParameters readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 4) == 0)
    {
      id v5 = *(void **)(a1 + 8);
      if (v5)
      {
        id v6 = v5;
        objc_sync_enter(v6);
        GEOPDAddressObjectGeocodingParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAddressObject_tags);
        objc_sync_exit(v6);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    id v7 = *(id *)(a1 + 24);
    id v8 = v7;
    if (v7)
    {
      if (a2)
      {
        v9 = [v7 base64EncodedStringWithOptions:0];
        [v4 setObject:v9 forKey:@"addressObject"];
      }
      else
      {
        [v4 setObject:v7 forKey:@"address_object"];
      }
    }

    if (*(unsigned char *)(a1 + 56))
    {
      id v10 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 52)];
      if (a2) {
        v11 = @"maxResults";
      }
      else {
        v11 = @"max_results";
      }
      [v4 setObject:v10 forKey:v11];
    }
    -[GEOPDAddressObjectGeocodingParameters _readViewportInfo](a1);
    id v12 = *(id *)(a1 + 32);
    v13 = v12;
    if (v12)
    {
      if (a2)
      {
        v14 = [v12 jsonRepresentation];
        v15 = @"viewportInfo";
      }
      else
      {
        v14 = [v12 dictionaryRepresentation];
        v15 = @"viewport_info";
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
        v23[2] = __67__GEOPDAddressObjectGeocodingParameters__dictionaryRepresentation___block_invoke;
        v23[3] = &unk_1E53D8860;
        id v20 = v19;
        id v24 = v20;
        [v18 enumerateKeysAndObjectsUsingBlock:v23];
        id v21 = v20;

        v18 = v21;
      }
      [v4 setObject:v18 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewportInfo, 0);
  objc_storeStrong((id *)&self->_addressObject, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOPDAddressObjectGeocodingParameters)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDAddressObjectGeocodingParameters;
  v2 = [(GEOPDAddressObjectGeocodingParameters *)&v6 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (GEOPDAddressObjectGeocodingParameters)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDAddressObjectGeocodingParameters;
  uint64_t v3 = [(GEOPDAddressObjectGeocodingParameters *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)setAddressObject:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 56) |= 4u;
  *(unsigned char *)(a1 + 56) |= 0x10u;
  objc_storeStrong((id *)(a1 + 24), a2);
}

- (void)_readViewportInfo
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
  if ((*(unsigned char *)(a1 + 56) & 8) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDAddressObjectGeocodingParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readViewportInfo_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
}

- (void)setViewportInfo:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 56) |= 8u;
  *(unsigned char *)(a1 + 56) |= 0x10u;
  objc_storeStrong((id *)(a1 + 32), a2);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDAddressObjectGeocodingParameters;
  id v4 = [(GEOPDAddressObjectGeocodingParameters *)&v8 description];
  id v5 = [(GEOPDAddressObjectGeocodingParameters *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAddressObjectGeocodingParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)jsonRepresentation
{
  return -[GEOPDAddressObjectGeocodingParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDAddressObjectGeocodingParametersReadAllFrom((uint64_t)self, a3, 0);
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
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDAddressObjectGeocodingParametersReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDAddressObjectGeocodingParameters readAll:]((uint64_t)self, 0);
  uint64_t v9 = [(NSData *)self->_addressObject copyWithZone:a3];
  id v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 52) = self->_maxResults;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  id v11 = [(GEOPDViewportInfo *)self->_viewportInfo copyWithZone:a3];
  id v12 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v11;

  v13 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v13;
LABEL_8:

  return (id)v5;
}

@end