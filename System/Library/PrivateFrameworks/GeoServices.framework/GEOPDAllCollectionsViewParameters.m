@interface GEOPDAllCollectionsViewParameters
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDAllCollectionsViewParameters)init;
- (GEOPDAllCollectionsViewParameters)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_readPublisherSuggestionParameters;
- (void)_readResultFilter;
- (void)_readViewportInfo;
- (void)readAll:(uint64_t)a1;
- (void)setPublisherSuggestionParameters:(uint64_t)a1;
- (void)setResultFilter:(uint64_t)a1;
- (void)setViewportInfo:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDAllCollectionsViewParameters

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        v6 = (int *)&readAll__recursiveTag_196;
      }
      else {
        v6 = (int *)&readAll__nonRecursiveTag_197;
      }
      GEOPDAllCollectionsViewParametersReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2)
    {
      -[GEOPDAllCollectionsViewResultFilter readAll:](*(void *)(a1 + 32), 1);
      [*(id *)(a1 + 40) readAll:1];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDAllCollectionsViewParametersIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOPDAllCollectionsViewParameters readAll:]((uint64_t)self, 0);
    if (self->_publisherSuggestionParameters) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v8;
    if (*(unsigned char *)&self->_flags)
    {
      PBDataWriterWriteUint32Field();
      id v5 = v8;
    }
    if (self->_resultFilter)
    {
      PBDataWriterWriteSubmessage();
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

- (GEOPDAllCollectionsViewParameters)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDAllCollectionsViewParameters;
  v3 = [(GEOPDAllCollectionsViewParameters *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
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
      GEOPDAllCollectionsViewParametersReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDAllCollectionsViewParameters readAll:]((uint64_t)self, 0);
  id v9 = [(GEOPDPublisherSuggestionParameters *)self->_publisherSuggestionParameters copyWithZone:a3];
  v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 60) = self->_numClientizedResults;
    *(unsigned char *)(v5 + 64) |= 1u;
  }
  id v11 = [(GEOPDAllCollectionsViewResultFilter *)self->_resultFilter copyWithZone:a3];
  v12 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v11;

  id v13 = [(GEOPDViewportInfo *)self->_viewportInfo copyWithZone:a3];
  v14 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v13;

  v15 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v15;
LABEL_8:

  return (id)v5;
}

- (GEOPDAllCollectionsViewParameters)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDAllCollectionsViewParameters;
  v2 = [(GEOPDAllCollectionsViewParameters *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)_readPublisherSuggestionParameters
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
  if ((*(unsigned char *)(a1 + 64) & 4) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDAllCollectionsViewParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPublisherSuggestionParameters_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
}

- (void)setPublisherSuggestionParameters:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 64) |= 4u;
  *(unsigned char *)(a1 + 64) |= 0x20u;
  objc_storeStrong((id *)(a1 + 24), a2);
}

- (void)_readResultFilter
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
  if ((*(unsigned char *)(a1 + 64) & 8) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDAllCollectionsViewParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readResultFilter_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
}

- (void)setResultFilter:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 64) |= 8u;
    *(unsigned char *)(a1 + 64) |= 0x20u;
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (void)_readViewportInfo
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
  if ((*(unsigned char *)(a1 + 64) & 0x10) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDAllCollectionsViewParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readViewportInfo_tags_175);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
}

- (void)setViewportInfo:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 64) |= 0x10u;
    *(unsigned char *)(a1 + 64) |= 0x20u;
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDAllCollectionsViewParameters;
  id v4 = [(GEOPDAllCollectionsViewParameters *)&v8 description];
  uint64_t v5 = [(GEOPDAllCollectionsViewParameters *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAllCollectionsViewParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDAllCollectionsViewParameters readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    -[GEOPDAllCollectionsViewParameters _readPublisherSuggestionParameters](a1);
    id v5 = *(id *)(a1 + 24);
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 jsonRepresentation];
        objc_super v8 = @"publisherSuggestionParameters";
      }
      else
      {
        objc_super v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"publisher_suggestion_parameters";
      }
      [v4 setObject:v7 forKey:v8];
    }
    if (*(unsigned char *)(a1 + 64))
    {
      id v9 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 60)];
      if (a2) {
        v10 = @"numClientizedResults";
      }
      else {
        v10 = @"num_clientized_results";
      }
      [v4 setObject:v9 forKey:v10];
    }
    -[GEOPDAllCollectionsViewParameters _readResultFilter](a1);
    id v11 = *(id *)(a1 + 32);
    v12 = v11;
    if (v11)
    {
      if (a2)
      {
        id v13 = [v11 jsonRepresentation];
        v14 = @"resultFilter";
      }
      else
      {
        id v13 = [v11 dictionaryRepresentation];
        v14 = @"result_filter";
      }
      [v4 setObject:v13 forKey:v14];
    }
    -[GEOPDAllCollectionsViewParameters _readViewportInfo](a1);
    id v15 = *(id *)(a1 + 40);
    v16 = v15;
    if (v15)
    {
      if (a2)
      {
        v17 = [v15 jsonRepresentation];
        v18 = @"viewportInfo";
      }
      else
      {
        v17 = [v15 dictionaryRepresentation];
        v18 = @"viewport_info";
      }
      [v4 setObject:v17 forKey:v18];
    }
    v19 = *(void **)(a1 + 16);
    if (v19)
    {
      v20 = [v19 dictionaryRepresentation];
      v21 = v20;
      if (a2)
      {
        v22 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v20, "count"));
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __63__GEOPDAllCollectionsViewParameters__dictionaryRepresentation___block_invoke;
        v26[3] = &unk_1E53D8860;
        id v23 = v22;
        id v27 = v23;
        [v21 enumerateKeysAndObjectsUsingBlock:v26];
        id v24 = v23;

        v21 = v24;
      }
      [v4 setObject:v21 forKey:@"Unknown Fields"];
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
  return -[GEOPDAllCollectionsViewParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __63__GEOPDAllCollectionsViewParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDAllCollectionsViewParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  -[GEOPDAllCollectionsViewParameters readAll:]((uint64_t)self, 1);
  -[GEOPDAllCollectionsViewParameters readAll:]((uint64_t)v4, 1);
  publisherSuggestionParameters = self->_publisherSuggestionParameters;
  if ((unint64_t)publisherSuggestionParameters | *((void *)v4 + 3))
  {
    if (!-[GEOPDPublisherSuggestionParameters isEqual:](publisherSuggestionParameters, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_numClientizedResults != *((_DWORD *)v4 + 15)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  resultFilter = self->_resultFilter;
  if ((unint64_t)resultFilter | *((void *)v4 + 4)
    && !-[GEOPDAllCollectionsViewResultFilter isEqual:](resultFilter, "isEqual:"))
  {
    goto LABEL_13;
  }
  viewportInfo = self->_viewportInfo;
  if ((unint64_t)viewportInfo | *((void *)v4 + 5)) {
    char v8 = -[GEOPDViewportInfo isEqual:](viewportInfo, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  -[GEOPDAllCollectionsViewParameters readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOPDPublisherSuggestionParameters *)self->_publisherSuggestionParameters hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v4 = 2654435761 * self->_numClientizedResults;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = v4 ^ v3;
  unint64_t v6 = [(GEOPDAllCollectionsViewResultFilter *)self->_resultFilter hash];
  return v5 ^ v6 ^ [(GEOPDViewportInfo *)self->_viewportInfo hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewportInfo, 0);
  objc_storeStrong((id *)&self->_resultFilter, 0);
  objc_storeStrong((id *)&self->_publisherSuggestionParameters, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end