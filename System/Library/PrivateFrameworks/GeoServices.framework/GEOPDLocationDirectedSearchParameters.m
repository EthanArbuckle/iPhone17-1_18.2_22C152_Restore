@interface GEOPDLocationDirectedSearchParameters
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDLocationDirectedSearchParameters)init;
- (GEOPDLocationDirectedSearchParameters)initWithData:(id)a3;
- (GEOPDLocationDirectedSearchParameters)initWithSearchURLQuery:(id)a3 coordinate:(id)a4 maxResults:(unsigned int)a5 traits:(id)a6;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)searchString;
- (uint64_t)hasGreenTeaWithValue:(uint64_t)result;
- (unint64_t)hash;
- (void)_readSearchFilter;
- (void)_readSearchLocation;
- (void)_readSearchString;
- (void)_readViewportInfo;
- (void)readAll:(uint64_t)a1;
- (void)setNearestTransitParameters:(uint64_t)a1;
- (void)setPaginationParameters:(uint64_t)a1;
- (void)setSearchFilter:(uint64_t)a1;
- (void)setSearchLocation:(uint64_t)a1;
- (void)setSearchString:(uint64_t)a1;
- (void)setViewportInfo:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDLocationDirectedSearchParameters

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        v6 = (int *)&readAll__recursiveTag_3619;
      }
      else {
        v6 = (int *)&readAll__nonRecursiveTag_3620;
      }
      GEOPDLocationDirectedSearchParametersReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDLocationDirectedSearchParametersCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (GEOPDLocationDirectedSearchParameters)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDLocationDirectedSearchParameters;
  v2 = [(GEOPDLocationDirectedSearchParameters *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDLocationDirectedSearchParameters)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDLocationDirectedSearchParameters;
  v3 = [(GEOPDLocationDirectedSearchParameters *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)_readSearchString
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 96) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDLocationDirectedSearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchString_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)searchString
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDLocationDirectedSearchParameters _readSearchString]((uint64_t)a1);
    a1 = (id *)v2[7];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setSearchString:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 96) |= 0x100u;
    *(_WORD *)(a1 + 96) |= 0x400u;
    objc_storeStrong((id *)(a1 + 56), a2);
  }
}

- (void)_readViewportInfo
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
  if ((*(_WORD *)(a1 + 96) & 0x200) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDLocationDirectedSearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readViewportInfo_tags_3585);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
}

- (void)setViewportInfo:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 96) |= 0x200u;
    *(_WORD *)(a1 + 96) |= 0x400u;
    objc_storeStrong((id *)(a1 + 64), a2);
  }
}

- (void)_readSearchLocation
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
  if ((*(_WORD *)(a1 + 96) & 0x80) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDLocationDirectedSearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchLocation_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
}

- (void)setSearchLocation:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 96) |= 0x80u;
    *(_WORD *)(a1 + 96) |= 0x400u;
    objc_storeStrong((id *)(a1 + 48), a2);
  }
}

- (void)setNearestTransitParameters:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 96) |= 0x10u;
    *(_WORD *)(a1 + 96) |= 0x400u;
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (void)setPaginationParameters:(uint64_t)a1
{
  id v4 = a2;
  *(_WORD *)(a1 + 96) |= 0x20u;
  *(_WORD *)(a1 + 96) |= 0x400u;
  objc_storeStrong((id *)(a1 + 32), a2);
}

- (void)_readSearchFilter
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
  if ((*(_WORD *)(a1 + 96) & 0x40) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDLocationDirectedSearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchFilter_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
}

- (void)setSearchFilter:(uint64_t)a1
{
  id v4 = a2;
  *(_WORD *)(a1 + 96) |= 0x40u;
  *(_WORD *)(a1 + 96) |= 0x400u;
  objc_storeStrong((id *)(a1 + 40), a2);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDLocationDirectedSearchParameters;
  id v4 = [(GEOPDLocationDirectedSearchParameters *)&v8 description];
  id v5 = [(GEOPDLocationDirectedSearchParameters *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDLocationDirectedSearchParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDLocationDirectedSearchParameters readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    __int16 v5 = *(_WORD *)(a1 + 96);
    if ((v5 & 4) != 0)
    {
      uint64_t v6 = *(int *)(a1 + 92);
      if (v6 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 92));
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

      __int16 v5 = *(_WORD *)(a1 + 96);
    }
    if (v5)
    {
      v9 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 84)];
      if (a2) {
        v10 = @"maxResults";
      }
      else {
        v10 = @"max_results";
      }
      [v4 setObject:v9 forKey:v10];
    }
    v11 = -[GEOPDLocationDirectedSearchParameters searchString]((id *)a1);
    if (v11)
    {
      if (a2) {
        v12 = @"searchString";
      }
      else {
        v12 = @"search_string";
      }
      [v4 setObject:v11 forKey:v12];
    }

    -[GEOPDLocationDirectedSearchParameters _readViewportInfo](a1);
    id v13 = *(id *)(a1 + 64);
    v14 = v13;
    if (v13)
    {
      if (a2)
      {
        v15 = [v13 jsonRepresentation];
        v16 = @"viewportInfo";
      }
      else
      {
        v15 = [v13 dictionaryRepresentation];
        v16 = @"viewport_info";
      }
      [v4 setObject:v15 forKey:v16];
    }
    -[GEOPDLocationDirectedSearchParameters _readSearchLocation](a1);
    id v17 = *(id *)(a1 + 48);
    v18 = v17;
    if (v17)
    {
      if (a2)
      {
        v19 = [v17 jsonRepresentation];
        v20 = @"searchLocation";
      }
      else
      {
        v19 = [v17 dictionaryRepresentation];
        v20 = @"search_location";
      }
      [v4 setObject:v19 forKey:v20];
    }
    if ((*(_WORD *)(a1 + 96) & 2) != 0)
    {
      uint64_t v21 = *(int *)(a1 + 88);
      if (v21 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 88));
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v22 = off_1E53DCBC8[v21];
      }
      if (a2) {
        v23 = @"searchType";
      }
      else {
        v23 = @"search_type";
      }
      [v4 setObject:v22 forKey:v23];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 96) & 0x10) == 0)
    {
      v24 = *(void **)(a1 + 8);
      if (v24)
      {
        id v25 = v24;
        objc_sync_enter(v25);
        GEOPDLocationDirectedSearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNearestTransitParameters_tags);
        objc_sync_exit(v25);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    id v26 = *(id *)(a1 + 24);
    v27 = v26;
    if (v26)
    {
      if (a2)
      {
        v28 = [v26 jsonRepresentation];
        v29 = @"nearestTransitParameters";
      }
      else
      {
        v28 = [v26 dictionaryRepresentation];
        v29 = @"nearest_transit_parameters";
      }
      [v4 setObject:v28 forKey:v29];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 96) & 0x20) == 0)
    {
      v30 = *(void **)(a1 + 8);
      if (v30)
      {
        id v31 = v30;
        objc_sync_enter(v31);
        GEOPDLocationDirectedSearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPaginationParameters_tags_3586);
        objc_sync_exit(v31);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    id v32 = *(id *)(a1 + 32);
    v33 = v32;
    if (v32)
    {
      if (a2)
      {
        v34 = [v32 jsonRepresentation];
        v35 = @"paginationParameters";
      }
      else
      {
        v34 = [v32 dictionaryRepresentation];
        v35 = @"pagination_parameters";
      }
      [v4 setObject:v34 forKey:v35];
    }
    -[GEOPDLocationDirectedSearchParameters _readSearchFilter](a1);
    id v36 = *(id *)(a1 + 40);
    v37 = v36;
    if (v36)
    {
      if (a2)
      {
        v38 = [v36 jsonRepresentation];
        v39 = @"searchFilter";
      }
      else
      {
        v38 = [v36 dictionaryRepresentation];
        v39 = @"search_filter";
      }
      [v4 setObject:v38 forKey:v39];
    }
    v40 = *(void **)(a1 + 16);
    if (v40)
    {
      v41 = [v40 dictionaryRepresentation];
      v42 = v41;
      if (a2)
      {
        v43 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v41, "count"));
        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 3221225472;
        v47[2] = __67__GEOPDLocationDirectedSearchParameters__dictionaryRepresentation___block_invoke;
        v47[3] = &unk_1E53D8860;
        id v44 = v43;
        id v48 = v44;
        [v42 enumerateKeysAndObjectsUsingBlock:v47];
        id v45 = v44;

        v42 = v45;
      }
      [v4 setObject:v42 forKey:@"Unknown Fields"];
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
  return -[GEOPDLocationDirectedSearchParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __67__GEOPDLocationDirectedSearchParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDLocationDirectedSearchParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDLocationDirectedSearchParametersIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOPDLocationDirectedSearchParameters readAll:]((uint64_t)self, 0);
    __int16 flags = (__int16)self->_flags;
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteInt32Field();
      __int16 flags = (__int16)self->_flags;
    }
    id v6 = v9;
    if (flags)
    {
      PBDataWriterWriteUint32Field();
      id v6 = v9;
    }
    if (self->_searchString)
    {
      PBDataWriterWriteStringField();
      id v6 = v9;
    }
    if (self->_viewportInfo)
    {
      PBDataWriterWriteSubmessage();
      id v6 = v9;
    }
    if (self->_searchLocation)
    {
      PBDataWriterWriteSubmessage();
      id v6 = v9;
    }
    if ((*(_WORD *)&self->_flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      id v6 = v9;
    }
    if (self->_nearestTransitParameters)
    {
      PBDataWriterWriteSubmessage();
      id v6 = v9;
    }
    if (self->_paginationParameters)
    {
      PBDataWriterWriteSubmessage();
      id v6 = v9;
    }
    if (self->_searchFilter)
    {
      PBDataWriterWriteSubmessage();
      id v6 = v9;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v6];
  }
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    -[GEOPDLocationDirectedSearchParameters _readSearchFilter](result);
    if (-[GEOPDSSearchFilter hasGreenTeaWithValue:](*(void *)(v3 + 40), a2)) {
      return 1;
    }
    -[GEOPDLocationDirectedSearchParameters _readSearchLocation](v3);
    if ([*(id *)(v3 + 48) hasGreenTeaWithValue:a2])
    {
      return 1;
    }
    else
    {
      -[GEOPDLocationDirectedSearchParameters _readViewportInfo](v3);
      id v4 = *(void **)(v3 + 64);
      return [v4 hasGreenTeaWithValue:a2];
    }
  }
  return result;
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
    if ((*(_WORD *)&self->_flags & 0x400) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDLocationDirectedSearchParametersReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_12;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDLocationDirectedSearchParameters readAll:]((uint64_t)self, 0);
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 92) = self->_sortOrder;
    *(_WORD *)(v5 + 96) |= 4u;
    __int16 flags = (__int16)self->_flags;
  }
  if (flags)
  {
    *(_DWORD *)(v5 + 84) = self->_maxResults;
    *(_WORD *)(v5 + 96) |= 1u;
  }
  uint64_t v10 = [(NSString *)self->_searchString copyWithZone:a3];
  v11 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v10;

  id v12 = [(GEOPDViewportInfo *)self->_viewportInfo copyWithZone:a3];
  id v13 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v12;

  id v14 = [(GEOLatLng *)self->_searchLocation copyWithZone:a3];
  v15 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v14;

  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 88) = self->_searchType;
    *(_WORD *)(v5 + 96) |= 2u;
  }
  id v16 = [(GEOPDNearestTransitParameters *)self->_nearestTransitParameters copyWithZone:a3];
  id v17 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v16;

  id v18 = [(GEOPDPaginationParameters *)self->_paginationParameters copyWithZone:a3];
  v19 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v18;

  id v20 = [(GEOPDSSearchFilter *)self->_searchFilter copyWithZone:a3];
  uint64_t v21 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v20;

  v22 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v22;
LABEL_12:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_29;
  }
  -[GEOPDLocationDirectedSearchParameters readAll:]((uint64_t)self, 1);
  -[GEOPDLocationDirectedSearchParameters readAll:]((uint64_t)v4, 1);
  __int16 flags = (__int16)self->_flags;
  __int16 v6 = *((_WORD *)v4 + 48);
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_sortOrder != *((_DWORD *)v4 + 23)) {
      goto LABEL_29;
    }
  }
  else if ((v6 & 4) != 0)
  {
LABEL_29:
    char v14 = 0;
    goto LABEL_30;
  }
  if (flags)
  {
    if ((v6 & 1) == 0 || self->_maxResults != *((_DWORD *)v4 + 21)) {
      goto LABEL_29;
    }
  }
  else if (v6)
  {
    goto LABEL_29;
  }
  searchString = self->_searchString;
  if ((unint64_t)searchString | *((void *)v4 + 7)
    && !-[NSString isEqual:](searchString, "isEqual:"))
  {
    goto LABEL_29;
  }
  viewportInfo = self->_viewportInfo;
  if ((unint64_t)viewportInfo | *((void *)v4 + 8))
  {
    if (!-[GEOPDViewportInfo isEqual:](viewportInfo, "isEqual:")) {
      goto LABEL_29;
    }
  }
  searchLocation = self->_searchLocation;
  if ((unint64_t)searchLocation | *((void *)v4 + 6))
  {
    if (!-[GEOLatLng isEqual:](searchLocation, "isEqual:")) {
      goto LABEL_29;
    }
  }
  __int16 v10 = *((_WORD *)v4 + 48);
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_searchType != *((_DWORD *)v4 + 22)) {
      goto LABEL_29;
    }
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_29;
  }
  nearestTransitParameters = self->_nearestTransitParameters;
  if ((unint64_t)nearestTransitParameters | *((void *)v4 + 3)
    && !-[GEOPDNearestTransitParameters isEqual:](nearestTransitParameters, "isEqual:"))
  {
    goto LABEL_29;
  }
  paginationParameters = self->_paginationParameters;
  if ((unint64_t)paginationParameters | *((void *)v4 + 4))
  {
    if (!-[GEOPDPaginationParameters isEqual:](paginationParameters, "isEqual:")) {
      goto LABEL_29;
    }
  }
  searchFilter = self->_searchFilter;
  if ((unint64_t)searchFilter | *((void *)v4 + 5)) {
    char v14 = -[GEOPDSSearchFilter isEqual:](searchFilter, "isEqual:");
  }
  else {
    char v14 = 1;
  }
LABEL_30:

  return v14;
}

- (unint64_t)hash
{
  -[GEOPDLocationDirectedSearchParameters readAll:]((uint64_t)self, 1);
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    uint64_t v4 = 2654435761 * self->_sortOrder;
    if (flags) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if (flags)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_maxResults;
      goto LABEL_6;
    }
  }
  uint64_t v5 = 0;
LABEL_6:
  NSUInteger v6 = [(NSString *)self->_searchString hash];
  unint64_t v7 = [(GEOPDViewportInfo *)self->_viewportInfo hash];
  unint64_t v8 = [(GEOLatLng *)self->_searchLocation hash];
  if ((*(_WORD *)&self->_flags & 2) != 0) {
    uint64_t v9 = 2654435761 * self->_searchType;
  }
  else {
    uint64_t v9 = 0;
  }
  NSUInteger v10 = v5 ^ v4 ^ v6 ^ v7 ^ v8;
  unint64_t v11 = v9 ^ [(GEOPDNearestTransitParameters *)self->_nearestTransitParameters hash];
  unint64_t v12 = v10 ^ v11 ^ [(GEOPDPaginationParameters *)self->_paginationParameters hash];
  return v12 ^ [(GEOPDSSearchFilter *)self->_searchFilter hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewportInfo, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_searchLocation, 0);
  objc_storeStrong((id *)&self->_searchFilter, 0);
  objc_storeStrong((id *)&self->_paginationParameters, 0);
  objc_storeStrong((id *)&self->_nearestTransitParameters, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOPDLocationDirectedSearchParameters)initWithSearchURLQuery:(id)a3 coordinate:(id)a4 maxResults:(unsigned int)a5 traits:(id)a6
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v11 = a3;
  id v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)GEOPDLocationDirectedSearchParameters;
  id v13 = [(GEOPDLocationDirectedSearchParameters *)&v19 init];
  char v14 = v13;
  if (v13)
  {
    if (a5)
    {
      *(_WORD *)&v13->_flags |= 0x400u;
      *(_WORD *)&v13->_flags |= 1u;
      v13->_maxResults = a5;
    }
    if ([v11 length]) {
      -[GEOPDLocationDirectedSearchParameters setSearchString:]((uint64_t)v14, v11);
    }
    if (var1 >= -180.0 && var1 <= 180.0 && var0 >= -90.0 && var0 <= 90.0)
    {
      v15 = -[GEOLatLng initWithCoordinate:]([GEOLatLng alloc], "initWithCoordinate:", var0, var1);
      -[GEOPDLocationDirectedSearchParameters setSearchLocation:]((uint64_t)v14, v15);
    }
    id v16 = +[GEOPDViewportInfo viewportInfoForTraits:v12];
    -[GEOPDLocationDirectedSearchParameters setViewportInfo:]((uint64_t)v14, v16);

    id v17 = v14;
  }

  return v14;
}

@end