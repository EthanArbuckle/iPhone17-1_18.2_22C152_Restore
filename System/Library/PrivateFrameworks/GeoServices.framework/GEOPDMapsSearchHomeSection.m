@interface GEOPDMapsSearchHomeSection
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDMapsSearchHomeSection)init;
- (GEOPDMapsSearchHomeSection)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)collectionSuggestionResult;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)guidesLocationsSuggestionResult;
- (id)jsonRepresentation;
- (id)name;
- (id)publisherSuggestionResult;
- (id)searchBrowseCategorySuggestionResult;
- (uint64_t)sectionType;
- (unint64_t)hash;
- (void)_readCollectionSuggestionResult;
- (void)_readGuidesLocationsSuggestionResult;
- (void)_readName;
- (void)_readPlaceSuggestionResult;
- (void)_readPublisherSuggestionResult;
- (void)_readSearchBrowseCategorySuggestionResult;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDMapsSearchHomeSection

- (void)writeTo:(id)a3
{
  id v11 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader) {
    goto LABEL_7;
  }
  os_unfair_lock_assert_owner(&self->_readerLock);
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x190) != 0) {
    goto LABEL_7;
  }
  if ((flags & 4) != 0)
  {
    if (GEOPDCollectionSuggestionResultIsDirty((os_unfair_lock_s *)self->_collectionSuggestionResult)) {
      goto LABEL_7;
    }
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 0x60) == 0)
  {
    if ((flags & 8) == 0
      || (guidesLocationsSuggestionResult = self->_guidesLocationsSuggestionResult) == 0
      || (os_unfair_lock_lock_with_options(),
          char IsDirty = _GEOPDGuidesLocationsSuggestionResultIsDirty((uint64_t)guidesLocationsSuggestionResult),
          os_unfair_lock_unlock(&guidesLocationsSuggestionResult->_readerLock),
          (IsDirty & 1) == 0))
    {
      v9 = self->_reader;
      objc_sync_enter(v9);
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      v10 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
      [v11 writeData:v10];
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v9);
      goto LABEL_22;
    }
  }
LABEL_7:
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDMapsSearchHomeSection readAll:]((uint64_t)self, 0);
  if (*(_WORD *)&self->_flags) {
    PBDataWriterWriteInt32Field();
  }
  id v6 = v11;
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    id v6 = v11;
  }
  if (self->_searchBrowseCategorySuggestionResult)
  {
    PBDataWriterWriteSubmessage();
    id v6 = v11;
  }
  if (self->_collectionSuggestionResult)
  {
    PBDataWriterWriteSubmessage();
    id v6 = v11;
  }
  if (self->_publisherSuggestionResult)
  {
    PBDataWriterWriteSubmessage();
    id v6 = v11;
  }
  if (self->_placeSuggestionResult)
  {
    PBDataWriterWriteSubmessage();
    id v6 = v11;
  }
  if (self->_guidesLocationsSuggestionResult)
  {
    PBDataWriterWriteSubmessage();
    id v6 = v11;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v6];
LABEL_22:
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
    if ((*(_WORD *)&self->_flags & 0x100) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDMapsSearchHomeSectionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDMapsSearchHomeSection readAll:]((uint64_t)self, 0);
  if (*(_WORD *)&self->_flags)
  {
    *(_DWORD *)(v5 + 84) = self->_sectionType;
    *(_WORD *)(v5 + 88) |= 1u;
  }
  uint64_t v9 = [(NSString *)self->_name copyWithZone:a3];
  v10 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v9;

  id v11 = [(GEOPDSearchBrowseCategorySuggestionResult *)self->_searchBrowseCategorySuggestionResult copyWithZone:a3];
  v12 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v11;

  id v13 = [(GEOPDCollectionSuggestionResult *)self->_collectionSuggestionResult copyWithZone:a3];
  v14 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v13;

  id v15 = [(GEOPDPublisherSuggestionResult *)self->_publisherSuggestionResult copyWithZone:a3];
  v16 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v15;

  id v17 = [(GEOPDPlaceSuggestionResult *)self->_placeSuggestionResult copyWithZone:a3];
  v18 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v17;

  id v19 = [(GEOPDGuidesLocationsSuggestionResult *)self->_guidesLocationsSuggestionResult copyWithZone:a3];
  v20 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v19;

  v21 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v21;
LABEL_8:

  return (id)v5;
}

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
        id v6 = (int *)&readAll__recursiveTag_3830;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_3831;
      }
      GEOPDMapsSearchHomeSectionReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2)
    {
      -[GEOPDCollectionSuggestionResult readAll:](*(void *)(a1 + 24), 1);
      -[GEOPDGuidesLocationsSuggestionResult readAll:](*(void *)(a1 + 32), 1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (GEOPDMapsSearchHomeSection)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDMapsSearchHomeSection;
  v2 = [(GEOPDMapsSearchHomeSection *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDMapsSearchHomeSection)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDMapsSearchHomeSection;
  v3 = [(GEOPDMapsSearchHomeSection *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (uint64_t)sectionType
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    __int16 v2 = *(_WORD *)(v1 + 88);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 80));
    if (v2) {
      return *(unsigned int *)(v1 + 84);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (void)_readName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x10) == 0)
    {
      __int16 v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDMapsSearchHomeSectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readName_tags_3806);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)name
{
  if (a1)
  {
    __int16 v2 = a1;
    -[GEOPDMapsSearchHomeSection _readName]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readSearchBrowseCategorySuggestionResult
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x80) == 0)
    {
      __int16 v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDMapsSearchHomeSectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchBrowseCategorySuggestionResult_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)searchBrowseCategorySuggestionResult
{
  if (a1)
  {
    __int16 v2 = a1;
    -[GEOPDMapsSearchHomeSection _readSearchBrowseCategorySuggestionResult]((uint64_t)a1);
    a1 = (id *)v2[8];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readCollectionSuggestionResult
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 4) == 0)
    {
      __int16 v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDMapsSearchHomeSectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCollectionSuggestionResult_tags_3807);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)collectionSuggestionResult
{
  if (a1)
  {
    __int16 v2 = a1;
    -[GEOPDMapsSearchHomeSection _readCollectionSuggestionResult]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readPublisherSuggestionResult
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x40) == 0)
    {
      __int16 v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDMapsSearchHomeSectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPublisherSuggestionResult_tags_3808);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)publisherSuggestionResult
{
  if (a1)
  {
    __int16 v2 = a1;
    -[GEOPDMapsSearchHomeSection _readPublisherSuggestionResult]((uint64_t)a1);
    a1 = (id *)v2[7];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readPlaceSuggestionResult
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
  if ((*(_WORD *)(a1 + 88) & 0x20) == 0)
  {
    __int16 v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDMapsSearchHomeSectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceSuggestionResult_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
}

- (void)_readGuidesLocationsSuggestionResult
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 8) == 0)
    {
      __int16 v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDMapsSearchHomeSectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readGuidesLocationsSuggestionResult_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)guidesLocationsSuggestionResult
{
  if (a1)
  {
    __int16 v2 = a1;
    -[GEOPDMapsSearchHomeSection _readGuidesLocationsSuggestionResult]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDMapsSearchHomeSection;
  v4 = [(GEOPDMapsSearchHomeSection *)&v8 description];
  id v5 = [(GEOPDMapsSearchHomeSection *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDMapsSearchHomeSection _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDMapsSearchHomeSection readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(_WORD *)(a1 + 88))
    {
      uint64_t v5 = *(int *)(a1 + 84);
      if (v5 >= 6)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 84));
        objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v6 = off_1E53DCBE0[v5];
      }
      if (a2) {
        objc_super v7 = @"sectionType";
      }
      else {
        objc_super v7 = @"section_type";
      }
      [v4 setObject:v6 forKey:v7];
    }
    objc_super v8 = -[GEOPDMapsSearchHomeSection name]((id *)a1);
    if (v8) {
      [v4 setObject:v8 forKey:@"name"];
    }

    uint64_t v9 = -[GEOPDMapsSearchHomeSection searchBrowseCategorySuggestionResult]((id *)a1);
    v10 = v9;
    if (v9)
    {
      if (a2)
      {
        id v11 = [v9 jsonRepresentation];
        v12 = @"searchBrowseCategorySuggestionResult";
      }
      else
      {
        id v11 = [v9 dictionaryRepresentation];
        v12 = @"search_browse_category_suggestion_result";
      }
      [v4 setObject:v11 forKey:v12];
    }
    id v13 = -[GEOPDMapsSearchHomeSection collectionSuggestionResult]((id *)a1);
    v14 = v13;
    if (v13)
    {
      if (a2)
      {
        id v15 = [v13 jsonRepresentation];
        v16 = @"collectionSuggestionResult";
      }
      else
      {
        id v15 = [v13 dictionaryRepresentation];
        v16 = @"collection_suggestion_result";
      }
      [v4 setObject:v15 forKey:v16];
    }
    id v17 = -[GEOPDMapsSearchHomeSection publisherSuggestionResult]((id *)a1);
    v18 = v17;
    if (v17)
    {
      if (a2)
      {
        id v19 = [v17 jsonRepresentation];
        v20 = @"publisherSuggestionResult";
      }
      else
      {
        id v19 = [v17 dictionaryRepresentation];
        v20 = @"publisher_suggestion_result";
      }
      [v4 setObject:v19 forKey:v20];
    }
    -[GEOPDMapsSearchHomeSection _readPlaceSuggestionResult](a1);
    id v21 = *(id *)(a1 + 48);
    v22 = v21;
    if (v21)
    {
      if (a2)
      {
        v23 = [v21 jsonRepresentation];
        v24 = @"placeSuggestionResult";
      }
      else
      {
        v23 = [v21 dictionaryRepresentation];
        v24 = @"place_suggestion_result";
      }
      [v4 setObject:v23 forKey:v24];
    }
    v25 = -[GEOPDMapsSearchHomeSection guidesLocationsSuggestionResult]((id *)a1);
    v26 = v25;
    if (v25)
    {
      if (a2)
      {
        v27 = [v25 jsonRepresentation];
        v28 = @"guidesLocationsSuggestionResult";
      }
      else
      {
        v27 = [v25 dictionaryRepresentation];
        v28 = @"guides_locations_suggestion_result";
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
        v36[2] = __56__GEOPDMapsSearchHomeSection__dictionaryRepresentation___block_invoke;
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
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDMapsSearchHomeSection _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __56__GEOPDMapsSearchHomeSection__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
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
  return GEOPDMapsSearchHomeSectionReadAllFrom((uint64_t)self, a3, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  -[GEOPDMapsSearchHomeSection readAll:]((uint64_t)self, 1);
  -[GEOPDMapsSearchHomeSection readAll:]((uint64_t)v4, 1);
  __int16 v5 = *((_WORD *)v4 + 44);
  if (*(_WORD *)&self->_flags)
  {
    if ((v5 & 1) == 0 || self->_sectionType != *((_DWORD *)v4 + 21)) {
      goto LABEL_19;
    }
  }
  else if (v5)
  {
LABEL_19:
    char v12 = 0;
    goto LABEL_20;
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 5) && !-[NSString isEqual:](name, "isEqual:")) {
    goto LABEL_19;
  }
  searchBrowseCategorySuggestionResult = self->_searchBrowseCategorySuggestionResult;
  if ((unint64_t)searchBrowseCategorySuggestionResult | *((void *)v4 + 8))
  {
    if (!-[GEOPDSearchBrowseCategorySuggestionResult isEqual:](searchBrowseCategorySuggestionResult, "isEqual:")) {
      goto LABEL_19;
    }
  }
  collectionSuggestionResult = self->_collectionSuggestionResult;
  if ((unint64_t)collectionSuggestionResult | *((void *)v4 + 3))
  {
    if (!-[GEOPDCollectionSuggestionResult isEqual:](collectionSuggestionResult, "isEqual:")) {
      goto LABEL_19;
    }
  }
  publisherSuggestionResult = self->_publisherSuggestionResult;
  if ((unint64_t)publisherSuggestionResult | *((void *)v4 + 7))
  {
    if (!-[GEOPDPublisherSuggestionResult isEqual:](publisherSuggestionResult, "isEqual:")) {
      goto LABEL_19;
    }
  }
  placeSuggestionResult = self->_placeSuggestionResult;
  if ((unint64_t)placeSuggestionResult | *((void *)v4 + 6))
  {
    if (!-[GEOPDPlaceSuggestionResult isEqual:](placeSuggestionResult, "isEqual:")) {
      goto LABEL_19;
    }
  }
  guidesLocationsSuggestionResult = self->_guidesLocationsSuggestionResult;
  if ((unint64_t)guidesLocationsSuggestionResult | *((void *)v4 + 4)) {
    char v12 = -[GEOPDGuidesLocationsSuggestionResult isEqual:](guidesLocationsSuggestionResult, "isEqual:");
  }
  else {
    char v12 = 1;
  }
LABEL_20:

  return v12;
}

- (unint64_t)hash
{
  -[GEOPDMapsSearchHomeSection readAll:]((uint64_t)self, 1);
  if (*(_WORD *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_sectionType;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_name hash] ^ v3;
  unint64_t v5 = [(GEOPDSearchBrowseCategorySuggestionResult *)self->_searchBrowseCategorySuggestionResult hash];
  unint64_t v6 = v4 ^ v5 ^ [(GEOPDCollectionSuggestionResult *)self->_collectionSuggestionResult hash];
  unint64_t v7 = [(GEOPDPublisherSuggestionResult *)self->_publisherSuggestionResult hash];
  unint64_t v8 = v7 ^ [(GEOPDPlaceSuggestionResult *)self->_placeSuggestionResult hash];
  return v6 ^ v8 ^ [(GEOPDGuidesLocationsSuggestionResult *)self->_guidesLocationsSuggestionResult hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchBrowseCategorySuggestionResult, 0);
  objc_storeStrong((id *)&self->_publisherSuggestionResult, 0);
  objc_storeStrong((id *)&self->_placeSuggestionResult, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_guidesLocationsSuggestionResult, 0);
  objc_storeStrong((id *)&self->_collectionSuggestionResult, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end