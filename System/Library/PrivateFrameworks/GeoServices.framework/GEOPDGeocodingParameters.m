@interface GEOPDGeocodingParameters
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDGeocodingParameters)init;
- (GEOPDGeocodingParameters)initWithData:(id)a3;
- (GEOPDGeocodingParameters)initWithForwardGeocodeAddress:(id)a3 addressString:(id)a4 maxResults:(unsigned int)a5 traits:(id)a6;
- (GEOPDGeocodingParameters)initWithForwardGeocodeAddress:(id)a3 maxResults:(unsigned int)a4 traits:(id)a5;
- (GEOPDGeocodingParameters)initWithForwardGeocodeAddressString:(id)a3 maxResults:(unsigned int)a4 traits:(id)a5;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)queryString;
- (id)structuredAddress;
- (uint64_t)hasGreenTeaWithValue:(uint64_t)result;
- (unint64_t)hash;
- (void)_readPunchInHints;
- (void)_readQueryString;
- (void)_readStructuredAddress;
- (void)_readViewportInfo;
- (void)readAll:(uint64_t)a1;
- (void)setAddressResultSubTypeFilter:(uint64_t)a1;
- (void)setPunchInHints:(uint64_t)a1;
- (void)setQueryString:(uint64_t)a1;
- (void)setStructuredAddress:(uint64_t)a1;
- (void)setViewportInfo:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDGeocodingParameters

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        v6 = (int *)&readAll__recursiveTag_3043;
      }
      else {
        v6 = (int *)&readAll__nonRecursiveTag_3044;
      }
      GEOPDGeocodingParametersReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDGeocodingParametersCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (GEOPDGeocodingParameters)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDGeocodingParameters;
  v2 = [(GEOPDGeocodingParameters *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDGeocodingParameters)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDGeocodingParameters;
  v3 = [(GEOPDGeocodingParameters *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)_readQueryString
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(_WORD *)(a1 + 84) & 0x20) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDGeocodingParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readQueryString_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
}

- (id)queryString
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDGeocodingParameters _readQueryString]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setQueryString:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 84) |= 0x20u;
    *(_WORD *)(a1 + 84) |= 0x100u;
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

- (void)_readViewportInfo
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(_WORD *)(a1 + 84) & 0x80) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDGeocodingParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readViewportInfo_tags_3027);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
}

- (void)setViewportInfo:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 84) |= 0x80u;
    *(_WORD *)(a1 + 84) |= 0x100u;
    objc_storeStrong((id *)(a1 + 56), a2);
  }
}

- (void)_readStructuredAddress
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(_WORD *)(a1 + 84) & 0x40) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDGeocodingParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStructuredAddress_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
}

- (id)structuredAddress
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDGeocodingParameters _readStructuredAddress]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setStructuredAddress:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 84) |= 0x40u;
    *(_WORD *)(a1 + 84) |= 0x100u;
    objc_storeStrong((id *)(a1 + 48), a2);
  }
}

- (void)_readPunchInHints
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(_WORD *)(a1 + 84) & 0x10) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDGeocodingParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPunchInHints_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
}

- (void)setPunchInHints:(uint64_t)a1
{
  id v4 = a2;
  *(_WORD *)(a1 + 84) |= 0x10u;
  *(_WORD *)(a1 + 84) |= 0x100u;
  objc_storeStrong((id *)(a1 + 32), a2);
}

- (void)setAddressResultSubTypeFilter:(uint64_t)a1
{
  id v4 = a2;
  *(_WORD *)(a1 + 84) |= 8u;
  *(_WORD *)(a1 + 84) |= 0x100u;
  objc_storeStrong((id *)(a1 + 24), a2);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDGeocodingParameters;
  id v4 = [(GEOPDGeocodingParameters *)&v8 description];
  id v5 = [(GEOPDGeocodingParameters *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDGeocodingParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDGeocodingParameters readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = -[GEOPDGeocodingParameters queryString]((id *)a1);
    if (v5)
    {
      if (a2) {
        objc_super v6 = @"queryString";
      }
      else {
        objc_super v6 = @"query_string";
      }
      [v4 setObject:v5 forKey:v6];
    }

    if (*(_WORD *)(a1 + 84))
    {
      objc_super v7 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 76)];
      if (a2) {
        objc_super v8 = @"maxResults";
      }
      else {
        objc_super v8 = @"max_results";
      }
      [v4 setObject:v7 forKey:v8];
    }
    -[GEOPDGeocodingParameters _readViewportInfo](a1);
    id v9 = *(id *)(a1 + 56);
    v10 = v9;
    if (v9)
    {
      if (a2)
      {
        v11 = [v9 jsonRepresentation];
        v12 = @"viewportInfo";
      }
      else
      {
        v11 = [v9 dictionaryRepresentation];
        v12 = @"viewport_info";
      }
      [v4 setObject:v11 forKey:v12];
    }
    v13 = -[GEOPDGeocodingParameters structuredAddress]((id *)a1);
    v14 = v13;
    if (v13)
    {
      if (a2)
      {
        v15 = [v13 jsonRepresentation];
        v16 = @"structuredAddress";
      }
      else
      {
        v15 = [v13 dictionaryRepresentation];
        v16 = @"structured_address";
      }
      [v4 setObject:v15 forKey:v16];
    }
    -[GEOPDGeocodingParameters _readPunchInHints](a1);
    id v17 = *(id *)(a1 + 32);
    v18 = v17;
    if (v17)
    {
      if (a2)
      {
        v19 = [v17 jsonRepresentation];
        v20 = @"punchInHints";
      }
      else
      {
        v19 = [v17 dictionaryRepresentation];
        v20 = @"punch_in_hints";
      }
      [v4 setObject:v19 forKey:v20];
    }
    if ((*(_WORD *)(a1 + 84) & 2) != 0)
    {
      v21 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 80)];
      if (a2) {
        v22 = @"isStrictMapRegion";
      }
      else {
        v22 = @"is_strict_map_region";
      }
      [v4 setObject:v21 forKey:v22];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 8) == 0)
    {
      v23 = *(void **)(a1 + 8);
      if (v23)
      {
        id v24 = v23;
        objc_sync_enter(v24);
        GEOPDGeocodingParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAddressResultSubTypeFilter_tags_3028);
        objc_sync_exit(v24);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    id v25 = *(id *)(a1 + 24);
    v26 = v25;
    if (v25)
    {
      if (a2)
      {
        v27 = [v25 jsonRepresentation];
        v28 = @"addressResultSubTypeFilter";
      }
      else
      {
        v27 = [v25 dictionaryRepresentation];
        v28 = @"address_result_sub_type_filter";
      }
      [v4 setObject:v27 forKey:v28];
    }
    v29 = *(void **)(a1 + 16);
    if (v29)
    {
      v30 = [v29 dictionaryRepresentation];
      v31 = v30;
      if (a2)
      {
        v32 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v30, "count"));
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __54__GEOPDGeocodingParameters__dictionaryRepresentation___block_invoke;
        v36[3] = &unk_1E53D8860;
        id v33 = v32;
        id v37 = v33;
        [v31 enumerateKeysAndObjectsUsingBlock:v36];
        id v34 = v33;

        v31 = v34;
      }
      [v4 setObject:v31 forKey:@"Unknown Fields"];
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
  return -[GEOPDGeocodingParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __54__GEOPDGeocodingParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDGeocodingParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEOPDGeocodingParametersIsDirty((uint64_t)self))
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
    -[GEOPDGeocodingParameters readAll:]((uint64_t)self, 0);
    if (self->_queryString) {
      PBDataWriterWriteStringField();
    }
    id v5 = v8;
    if (*(_WORD *)&self->_flags)
    {
      PBDataWriterWriteUint32Field();
      id v5 = v8;
    }
    if (self->_viewportInfo)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_structuredAddress)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_punchInHints)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if ((*(_WORD *)&self->_flags & 2) != 0)
    {
      PBDataWriterWriteBOOLField();
      id v5 = v8;
    }
    if (self->_addressResultSubTypeFilter)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    -[GEOPDGeocodingParameters _readPunchInHints](result);
    if (-[GEOPDSPunchInHints hasGreenTeaWithValue:](*(void *)(v3 + 32), a2))
    {
      return 1;
    }
    else
    {
      -[GEOPDGeocodingParameters _readViewportInfo](v3);
      id v4 = *(void **)(v3 + 56);
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
    if ((*(_WORD *)&self->_flags & 0x100) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDGeocodingParametersReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDGeocodingParameters readAll:]((uint64_t)self, 0);
  uint64_t v9 = [(NSString *)self->_queryString copyWithZone:a3];
  id v10 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v9;

  if (*(_WORD *)&self->_flags)
  {
    *(_DWORD *)(v5 + 76) = self->_maxResults;
    *(_WORD *)(v5 + 84) |= 1u;
  }
  id v11 = [(GEOPDViewportInfo *)self->_viewportInfo copyWithZone:a3];
  v12 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v11;

  id v13 = [(GEOStructuredAddress *)self->_structuredAddress copyWithZone:a3];
  v14 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v13;

  id v15 = [(GEOPDSPunchInHints *)self->_punchInHints copyWithZone:a3];
  v16 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v15;

  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(unsigned char *)(v5 + 80) = self->_isStrictMapRegion;
    *(_WORD *)(v5 + 84) |= 2u;
  }
  id v17 = [(GEOPDAddressResultSubTypeFilter *)self->_addressResultSubTypeFilter copyWithZone:a3];
  v18 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v17;

  v19 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v19;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  -[GEOPDGeocodingParameters readAll:]((uint64_t)self, 1);
  -[GEOPDGeocodingParameters readAll:]((uint64_t)v4, 1);
  queryString = self->_queryString;
  if ((unint64_t)queryString | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](queryString, "isEqual:")) {
      goto LABEL_19;
    }
  }
  __int16 v6 = *((_WORD *)v4 + 42);
  if (*(_WORD *)&self->_flags)
  {
    if ((v6 & 1) == 0 || self->_maxResults != *((_DWORD *)v4 + 19)) {
      goto LABEL_19;
    }
  }
  else if (v6)
  {
    goto LABEL_19;
  }
  viewportInfo = self->_viewportInfo;
  if ((unint64_t)viewportInfo | *((void *)v4 + 7) && !-[GEOPDViewportInfo isEqual:](viewportInfo, "isEqual:")) {
    goto LABEL_19;
  }
  structuredAddress = self->_structuredAddress;
  if ((unint64_t)structuredAddress | *((void *)v4 + 6))
  {
    if (!-[GEOStructuredAddress isEqual:](structuredAddress, "isEqual:")) {
      goto LABEL_19;
    }
  }
  punchInHints = self->_punchInHints;
  if ((unint64_t)punchInHints | *((void *)v4 + 4))
  {
    if (!-[GEOPDSPunchInHints isEqual:](punchInHints, "isEqual:")) {
      goto LABEL_19;
    }
  }
  __int16 v10 = *((_WORD *)v4 + 42);
  if ((*(_WORD *)&self->_flags & 2) == 0)
  {
    if ((v10 & 2) == 0) {
      goto LABEL_25;
    }
LABEL_19:
    char v11 = 0;
    goto LABEL_20;
  }
  if ((v10 & 2) == 0) {
    goto LABEL_19;
  }
  if (!self->_isStrictMapRegion)
  {
    if (!*((unsigned char *)v4 + 80)) {
      goto LABEL_25;
    }
    goto LABEL_19;
  }
  if (!*((unsigned char *)v4 + 80)) {
    goto LABEL_19;
  }
LABEL_25:
  addressResultSubTypeFilter = self->_addressResultSubTypeFilter;
  if ((unint64_t)addressResultSubTypeFilter | *((void *)v4 + 3)) {
    char v11 = -[GEOPDAddressResultSubTypeFilter isEqual:](addressResultSubTypeFilter, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_20:

  return v11;
}

- (unint64_t)hash
{
  -[GEOPDGeocodingParameters readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_queryString hash];
  if (*(_WORD *)&self->_flags) {
    uint64_t v4 = 2654435761 * self->_maxResults;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = [(GEOPDViewportInfo *)self->_viewportInfo hash];
  unint64_t v6 = [(GEOStructuredAddress *)self->_structuredAddress hash];
  unint64_t v7 = [(GEOPDSPunchInHints *)self->_punchInHints hash];
  if ((*(_WORD *)&self->_flags & 2) != 0) {
    uint64_t v8 = 2654435761 * self->_isStrictMapRegion;
  }
  else {
    uint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ [(GEOPDAddressResultSubTypeFilter *)self->_addressResultSubTypeFilter hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewportInfo, 0);
  objc_storeStrong((id *)&self->_structuredAddress, 0);
  objc_storeStrong((id *)&self->_queryString, 0);
  objc_storeStrong((id *)&self->_punchInHints, 0);
  objc_storeStrong((id *)&self->_addressResultSubTypeFilter, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOPDGeocodingParameters)initWithForwardGeocodeAddress:(id)a3 addressString:(id)a4 maxResults:(unsigned int)a5 traits:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)GEOPDGeocodingParameters;
  id v13 = [(GEOPDGeocodingParameters *)&v19 init];
  if (v13)
  {
    if (v10)
    {
      v14 = [v10 structuredAddress];

      if (v14)
      {
        id v15 = [v10 structuredAddress];
        -[GEOPDGeocodingParameters setStructuredAddress:]((uint64_t)v13, v15);
      }
    }
    if (v11 && [v11 length]) {
      -[GEOPDGeocodingParameters setQueryString:]((uint64_t)v13, v11);
    }
    if (a5)
    {
      *(_WORD *)&v13->_flags |= 0x100u;
      *(_WORD *)&v13->_flags |= 1u;
      v13->_maxResults = a5;
    }
    v16 = +[GEOPDViewportInfo viewportInfoForTraits:v12];
    -[GEOPDGeocodingParameters setViewportInfo:]((uint64_t)v13, v16);

    id v17 = v13;
  }

  return v13;
}

- (GEOPDGeocodingParameters)initWithForwardGeocodeAddress:(id)a3 maxResults:(unsigned int)a4 traits:(id)a5
{
  return [(GEOPDGeocodingParameters *)self initWithForwardGeocodeAddress:a3 addressString:0 maxResults:*(void *)&a4 traits:a5];
}

- (GEOPDGeocodingParameters)initWithForwardGeocodeAddressString:(id)a3 maxResults:(unsigned int)a4 traits:(id)a5
{
  return [(GEOPDGeocodingParameters *)self initWithForwardGeocodeAddress:0 addressString:a3 maxResults:*(void *)&a4 traits:a5];
}

@end