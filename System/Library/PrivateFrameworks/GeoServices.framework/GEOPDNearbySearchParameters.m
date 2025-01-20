@interface GEOPDNearbySearchParameters
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDNearbySearchParameters)init;
- (GEOPDNearbySearchParameters)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_readViewportInfo;
- (void)readAll:(uint64_t)a1;
- (void)setNearbySearchFilter:(uint64_t)a1;
- (void)setViewportInfo:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDNearbySearchParameters

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
        v6 = (int *)&readAll__recursiveTag_4441;
      }
      else {
        v6 = (int *)&readAll__nonRecursiveTag_4442;
      }
      GEOPDNearbySearchParametersReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      [*(id *)(a1 + 32) readAll:1];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (GEOPDNearbySearchParameters)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDNearbySearchParameters;
  v2 = [(GEOPDNearbySearchParameters *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDNearbySearchParameters)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDNearbySearchParameters;
  v3 = [(GEOPDNearbySearchParameters *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)_readViewportInfo
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
  if ((*(unsigned char *)(a1 + 60) & 0x10) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDNearbySearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readViewportInfo_tags_4433);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
}

- (void)setViewportInfo:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 60) |= 0x10u;
  *(unsigned char *)(a1 + 60) |= 0x20u;
  objc_storeStrong((id *)(a1 + 32), a2);
}

- (void)setNearbySearchFilter:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 60) |= 8u;
  *(unsigned char *)(a1 + 60) |= 0x20u;
  objc_storeStrong((id *)(a1 + 24), a2);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDNearbySearchParameters;
  id v4 = [(GEOPDNearbySearchParameters *)&v8 description];
  id v5 = [(GEOPDNearbySearchParameters *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDNearbySearchParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDNearbySearchParameters readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 60);
    if ((v5 & 2) != 0)
    {
      uint64_t v6 = *(int *)(a1 + 56);
      if (v6 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 56));
        objc_super v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v7 = off_1E53DD1C8[v6];
      }
      if (a2) {
        objc_super v8 = @"sortOrder";
      }
      else {
        objc_super v8 = @"sort_order";
      }
      [v4 setObject:v7 forKey:v8];

      char v5 = *(unsigned char *)(a1 + 60);
    }
    if (v5)
    {
      v9 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 52)];
      if (a2) {
        v10 = @"maxResults";
      }
      else {
        v10 = @"max_results";
      }
      [v4 setObject:v9 forKey:v10];
    }
    -[GEOPDNearbySearchParameters _readViewportInfo](a1);
    id v11 = *(id *)(a1 + 32);
    v12 = v11;
    if (v11)
    {
      if (a2)
      {
        v13 = [v11 jsonRepresentation];
        v14 = @"viewportInfo";
      }
      else
      {
        v13 = [v11 dictionaryRepresentation];
        v14 = @"viewport_info";
      }
      [v4 setObject:v13 forKey:v14];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 60) & 8) == 0)
    {
      v15 = *(void **)(a1 + 8);
      if (v15)
      {
        id v16 = v15;
        objc_sync_enter(v16);
        GEOPDNearbySearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNearbySearchFilter_tags);
        objc_sync_exit(v16);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    id v17 = *(id *)(a1 + 24);
    v18 = v17;
    if (v17)
    {
      if (a2)
      {
        v19 = [v17 jsonRepresentation];
        v20 = @"nearbySearchFilter";
      }
      else
      {
        v19 = [v17 dictionaryRepresentation];
        v20 = @"nearby_search_filter";
      }
      [v4 setObject:v19 forKey:v20];
    }
    v21 = *(void **)(a1 + 16);
    if (v21)
    {
      v22 = [v21 dictionaryRepresentation];
      v23 = v22;
      if (a2)
      {
        v24 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v22, "count"));
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __57__GEOPDNearbySearchParameters__dictionaryRepresentation___block_invoke;
        v28[3] = &unk_1E53D8860;
        id v25 = v24;
        id v29 = v25;
        [v23 enumerateKeysAndObjectsUsingBlock:v28];
        id v26 = v25;

        v23 = v26;
      }
      [v4 setObject:v23 forKey:@"Unknown Fields"];
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
  return -[GEOPDNearbySearchParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __57__GEOPDNearbySearchParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDNearbySearchParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x38) == 0))
  {
    objc_super v7 = self->_reader;
    objc_sync_enter(v7);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v9 writeData:v8];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDNearbySearchParameters readAll:]((uint64_t)self, 0);
    char flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      char flags = (char)self->_flags;
    }
    id v6 = v9;
    if (flags)
    {
      PBDataWriterWriteUint32Field();
      id v6 = v9;
    }
    if (self->_viewportInfo)
    {
      PBDataWriterWriteSubmessage();
      id v6 = v9;
    }
    if (self->_nearbySearchFilter)
    {
      PBDataWriterWriteSubmessage();
      id v6 = v9;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v6];
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
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDNearbySearchParametersReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDNearbySearchParameters readAll:]((uint64_t)self, 0);
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_sortOrder;
    *(unsigned char *)(v5 + 60) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(_DWORD *)(v5 + 52) = self->_maxResults;
    *(unsigned char *)(v5 + 60) |= 1u;
  }
  id v10 = [(GEOPDViewportInfo *)self->_viewportInfo copyWithZone:a3];
  id v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  id v12 = [(GEOPDNearbySearchFilter *)self->_nearbySearchFilter copyWithZone:a3];
  v13 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v12;

  v14 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v14;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  -[GEOPDNearbySearchParameters readAll:]((uint64_t)self, 1);
  -[GEOPDNearbySearchParameters readAll:]((uint64_t)v4, 1);
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0 || self->_sortOrder != *((_DWORD *)v4 + 14)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
LABEL_16:
    char v7 = 0;
    goto LABEL_17;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_maxResults != *((_DWORD *)v4 + 13)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
    goto LABEL_16;
  }
  viewportInfo = self->_viewportInfo;
  if ((unint64_t)viewportInfo | *((void *)v4 + 4) && !-[GEOPDViewportInfo isEqual:](viewportInfo, "isEqual:")) {
    goto LABEL_16;
  }
  nearbySearchFilter = self->_nearbySearchFilter;
  if ((unint64_t)nearbySearchFilter | *((void *)v4 + 3)) {
    char v7 = -[GEOPDNearbySearchFilter isEqual:](nearbySearchFilter, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_17:

  return v7;
}

- (unint64_t)hash
{
  -[GEOPDNearbySearchParameters readAll:]((uint64_t)self, 1);
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_sortOrder;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    goto LABEL_6;
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_maxResults;
LABEL_6:
  unint64_t v5 = v4 ^ v3 ^ [(GEOPDViewportInfo *)self->_viewportInfo hash];
  return v5 ^ [(GEOPDNearbySearchFilter *)self->_nearbySearchFilter hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewportInfo, 0);
  objc_storeStrong((id *)&self->_nearbySearchFilter, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end