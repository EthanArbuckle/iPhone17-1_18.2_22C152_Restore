@interface GEOPDQueryUnderstandingParameters
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDQueryUnderstandingParameters)init;
- (GEOPDQueryUnderstandingParameters)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_readViewportInfo;
- (void)readAll:(uint64_t)a1;
- (void)setSearchString:(uint64_t)a1;
- (void)setTaxonomyLookupParameters:(uint64_t)a1;
- (void)setTaxonomySearchParameters:(uint64_t)a1;
- (void)setViewportInfo:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDQueryUnderstandingParameters

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        v6 = (int *)&readAll__recursiveTag_6291;
      }
      else {
        v6 = (int *)&readAll__nonRecursiveTag_6292;
      }
      GEOPDQueryUnderstandingParametersReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDQueryUnderstandingParametersCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (void)setTaxonomyLookupParameters:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 76) |= 0x10u;
  *(unsigned char *)(a1 + 76) |= 0x80u;
  objc_storeStrong((id *)(a1 + 32), a2);
}

- (unint64_t)hash
{
  -[GEOPDQueryUnderstandingParameters readAll:]((uint64_t)self, 1);
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_type;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_searchString hash];
  unint64_t v5 = [(GEOPDViewportInfo *)self->_viewportInfo hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v6 = 2654435761 * self->_workflow;
  }
  else {
    uint64_t v6 = 0;
  }
  NSUInteger v7 = v4 ^ v3 ^ v5 ^ v6;
  unint64_t v8 = [(GEOPDQueryUnderstandingTaxonomySearchParameters *)self->_taxonomySearchParameters hash];
  return v7 ^ v8 ^ [(GEOPDQueryUnderstandingTaxonomyLookupParameters *)self->_taxonomyLookupParameters hash];
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDQueryUnderstandingParameters readAll:](a1, 1);
    NSUInteger v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 76))
    {
      uint64_t v5 = *(int *)(a1 + 68);
      if (v5 >= 5)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 68));
        uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v6 = off_1E53DCE90[v5];
      }
      [v4 setObject:v6 forKey:@"type"];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 8) == 0)
    {
      NSUInteger v7 = *(void **)(a1 + 8);
      if (v7)
      {
        id v8 = v7;
        objc_sync_enter(v8);
        GEOPDQueryUnderstandingParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchString_tags_6272);
        objc_sync_exit(v8);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    id v9 = *(id *)(a1 + 24);
    if (v9)
    {
      if (a2) {
        v10 = @"searchString";
      }
      else {
        v10 = @"search_string";
      }
      [v4 setObject:v9 forKey:v10];
    }

    -[GEOPDQueryUnderstandingParameters _readViewportInfo](a1);
    id v11 = *(id *)(a1 + 48);
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
    if ((*(unsigned char *)(a1 + 76) & 2) != 0)
    {
      uint64_t v15 = *(int *)(a1 + 72);
      if (v15 >= 5)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 72));
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = off_1E53DCEB8[v15];
      }
      [v4 setObject:v16 forKey:@"workflow"];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 0x20) == 0)
    {
      v17 = *(void **)(a1 + 8);
      if (v17)
      {
        id v18 = v17;
        objc_sync_enter(v18);
        GEOPDQueryUnderstandingParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTaxonomySearchParameters_tags);
        objc_sync_exit(v18);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    id v19 = *(id *)(a1 + 40);
    v20 = v19;
    if (v19)
    {
      if (a2)
      {
        v21 = [v19 jsonRepresentation];
        v22 = @"taxonomySearchParameters";
      }
      else
      {
        v21 = [v19 dictionaryRepresentation];
        v22 = @"taxonomy_search_parameters";
      }
      [v4 setObject:v21 forKey:v22];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 0x10) == 0)
    {
      v23 = *(void **)(a1 + 8);
      if (v23)
      {
        id v24 = v23;
        objc_sync_enter(v24);
        GEOPDQueryUnderstandingParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTaxonomyLookupParameters_tags);
        objc_sync_exit(v24);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    id v25 = *(id *)(a1 + 32);
    v26 = v25;
    if (v25)
    {
      if (a2)
      {
        v27 = [v25 jsonRepresentation];
        v28 = @"taxonomyLookupParameters";
      }
      else
      {
        v27 = [v25 dictionaryRepresentation];
        v28 = @"taxonomy_lookup_parameters";
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
        v36[2] = __63__GEOPDQueryUnderstandingParameters__dictionaryRepresentation___block_invoke;
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
    NSUInteger v4 = 0;
  }

  return v4;
}

- (GEOPDQueryUnderstandingParameters)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDQueryUnderstandingParameters;
  v2 = [(GEOPDQueryUnderstandingParameters *)&v6 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    NSUInteger v4 = v2;
  }

  return v3;
}

- (GEOPDQueryUnderstandingParameters)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDQueryUnderstandingParameters;
  uint64_t v3 = [(GEOPDQueryUnderstandingParameters *)&v7 initWithData:a3];
  NSUInteger v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (void)setSearchString:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 76) |= 8u;
  *(unsigned char *)(a1 + 76) |= 0x80u;
  objc_storeStrong((id *)(a1 + 24), a2);
}

- (void)_readViewportInfo
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  if ((*(unsigned char *)(a1 + 76) & 0x40) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDQueryUnderstandingParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readViewportInfo_tags_6273);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
}

- (void)setViewportInfo:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 76) |= 0x40u;
  *(unsigned char *)(a1 + 76) |= 0x80u;
  objc_storeStrong((id *)(a1 + 48), a2);
}

- (void)setTaxonomySearchParameters:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 76) |= 0x20u;
  *(unsigned char *)(a1 + 76) |= 0x80u;
  objc_storeStrong((id *)(a1 + 40), a2);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDQueryUnderstandingParameters;
  id v4 = [(GEOPDQueryUnderstandingParameters *)&v8 description];
  uint64_t v5 = [(GEOPDQueryUnderstandingParameters *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDQueryUnderstandingParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)jsonRepresentation
{
  return -[GEOPDQueryUnderstandingParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __63__GEOPDQueryUnderstandingParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDQueryUnderstandingParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDQueryUnderstandingParametersIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOPDQueryUnderstandingParameters readAll:]((uint64_t)self, 0);
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    id v5 = v8;
    if (self->_searchString)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_viewportInfo)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if ((*(unsigned char *)&self->_flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      id v5 = v8;
    }
    if (self->_taxonomySearchParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_taxonomyLookupParameters)
    {
      PBDataWriterWriteSubmessage();
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
    if ((*(unsigned char *)&self->_flags & 0x80000000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDQueryUnderstandingParametersReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDQueryUnderstandingParameters readAll:]((uint64_t)self, 0);
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 68) = self->_type;
    *(unsigned char *)(v5 + 76) |= 1u;
  }
  uint64_t v9 = [(NSString *)self->_searchString copyWithZone:a3];
  id v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  id v11 = [(GEOPDViewportInfo *)self->_viewportInfo copyWithZone:a3];
  v12 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v11;

  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_workflow;
    *(unsigned char *)(v5 + 76) |= 2u;
  }
  id v13 = [(GEOPDQueryUnderstandingTaxonomySearchParameters *)self->_taxonomySearchParameters copyWithZone:a3];
  v14 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v13;

  id v15 = [(GEOPDQueryUnderstandingTaxonomyLookupParameters *)self->_taxonomyLookupParameters copyWithZone:a3];
  v16 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v15;

  v17 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v17;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  -[GEOPDQueryUnderstandingParameters readAll:]((uint64_t)self, 1);
  -[GEOPDQueryUnderstandingParameters readAll:]((uint64_t)v4, 1);
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 76) & 1) == 0 || self->_type != *((_DWORD *)v4 + 17)) {
      goto LABEL_20;
    }
  }
  else if (*((unsigned char *)v4 + 76))
  {
LABEL_20:
    char v9 = 0;
    goto LABEL_21;
  }
  searchString = self->_searchString;
  if ((unint64_t)searchString | *((void *)v4 + 3)
    && !-[NSString isEqual:](searchString, "isEqual:"))
  {
    goto LABEL_20;
  }
  viewportInfo = self->_viewportInfo;
  if ((unint64_t)viewportInfo | *((void *)v4 + 6))
  {
    if (!-[GEOPDViewportInfo isEqual:](viewportInfo, "isEqual:")) {
      goto LABEL_20;
    }
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 2) == 0 || self->_workflow != *((_DWORD *)v4 + 18)) {
      goto LABEL_20;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 2) != 0)
  {
    goto LABEL_20;
  }
  taxonomySearchParameters = self->_taxonomySearchParameters;
  if ((unint64_t)taxonomySearchParameters | *((void *)v4 + 5)
    && !-[GEOPDQueryUnderstandingTaxonomySearchParameters isEqual:](taxonomySearchParameters, "isEqual:"))
  {
    goto LABEL_20;
  }
  taxonomyLookupParameters = self->_taxonomyLookupParameters;
  if ((unint64_t)taxonomyLookupParameters | *((void *)v4 + 4)) {
    char v9 = -[GEOPDQueryUnderstandingTaxonomyLookupParameters isEqual:](taxonomyLookupParameters, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_21:

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewportInfo, 0);
  objc_storeStrong((id *)&self->_taxonomySearchParameters, 0);
  objc_storeStrong((id *)&self->_taxonomyLookupParameters, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end