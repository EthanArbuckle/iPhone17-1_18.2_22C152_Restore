@interface GEOPDMapsSearchHomeParameters
- (BOOL)hasGreenTeaWithValue:(BOOL)result;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDMapsSearchHomeParameters)init;
- (GEOPDMapsSearchHomeParameters)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_readCollectionSuggestionParameters;
- (void)_readGuidesLocationsSuggestionParameters;
- (void)_readPlaceSuggestionParameters;
- (void)_readPublisherSuggestionParameters;
- (void)_readSearchBrowseCategorySuggestionParameters;
- (void)_readSearchOriginationInfo;
- (void)_readSupportedSectionTypes;
- (void)addSupportedSectionType:(uint64_t)a1;
- (void)dealloc;
- (void)readAll:(uint64_t)a1;
- (void)setCollectionSuggestionParameters:(uint64_t)a1;
- (void)setGuidesLocationsSuggestionParameters:(uint64_t)a1;
- (void)setPlaceSuggestionParameters:(uint64_t)a1;
- (void)setPublisherSuggestionParameters:(uint64_t)a1;
- (void)setSearchBrowseCategorySuggestionParameters:(uint64_t)a1;
- (void)setSearchOriginationInfo:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDMapsSearchHomeParameters

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        v6 = (int *)&readAll__recursiveTag_3772;
      }
      else {
        v6 = (int *)&readAll__nonRecursiveTag_3773;
      }
      GEOPDMapsSearchHomeParametersReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDMapsSearchHomeParametersCallReadAllRecursiveWithoutSynchronized((uint64_t *)a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (GEOPDMapsSearchHomeParameters)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDMapsSearchHomeParameters;
  v2 = [(GEOPDMapsSearchHomeParameters *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDMapsSearchHomeParameters)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDMapsSearchHomeParameters;
  v3 = [(GEOPDMapsSearchHomeParameters *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDMapsSearchHomeParameters;
  [(GEOPDMapsSearchHomeParameters *)&v3 dealloc];
}

- (void)_readSupportedSectionTypes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 108) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDMapsSearchHomeParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSupportedSectionTypes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (void)addSupportedSectionType:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDMapsSearchHomeParameters _readSupportedSectionTypes](a1);
    PBRepeatedInt32Add();
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 108) |= 2u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
    *(_WORD *)(a1 + 108) |= 0x100u;
  }
}

- (void)_readSearchBrowseCategorySuggestionParameters
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
  if ((*(_WORD *)(a1 + 108) & 0x40) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDMapsSearchHomeParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchBrowseCategorySuggestionParameters_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
}

- (void)setSearchBrowseCategorySuggestionParameters:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 108) |= 0x40u;
    *(_WORD *)(a1 + 108) |= 0x100u;
    objc_storeStrong((id *)(a1 + 80), a2);
  }
}

- (void)_readCollectionSuggestionParameters
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
  if ((*(_WORD *)(a1 + 108) & 4) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDMapsSearchHomeParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCollectionSuggestionParameters_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
}

- (void)setCollectionSuggestionParameters:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 108) |= 4u;
    *(_WORD *)(a1 + 108) |= 0x100u;
    objc_storeStrong((id *)(a1 + 48), a2);
  }
}

- (void)_readPublisherSuggestionParameters
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
  if ((*(_WORD *)(a1 + 108) & 0x20) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDMapsSearchHomeParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPublisherSuggestionParameters_tags_3743);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
}

- (void)setPublisherSuggestionParameters:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 108) |= 0x20u;
    *(_WORD *)(a1 + 108) |= 0x100u;
    objc_storeStrong((id *)(a1 + 72), a2);
  }
}

- (void)_readPlaceSuggestionParameters
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
  if ((*(_WORD *)(a1 + 108) & 0x10) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDMapsSearchHomeParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceSuggestionParameters_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
}

- (void)setPlaceSuggestionParameters:(uint64_t)a1
{
  id v4 = a2;
  *(_WORD *)(a1 + 108) |= 0x10u;
  *(_WORD *)(a1 + 108) |= 0x100u;
  objc_storeStrong((id *)(a1 + 64), a2);
}

- (void)_readGuidesLocationsSuggestionParameters
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
  if ((*(_WORD *)(a1 + 108) & 8) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDMapsSearchHomeParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readGuidesLocationsSuggestionParameters_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
}

- (void)setGuidesLocationsSuggestionParameters:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 108) |= 8u;
    *(_WORD *)(a1 + 108) |= 0x100u;
    objc_storeStrong((id *)(a1 + 56), a2);
  }
}

- (void)_readSearchOriginationInfo
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
  if ((*(_WORD *)(a1 + 108) & 0x80) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDMapsSearchHomeParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchOriginationInfo_tags_3744);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
}

- (void)setSearchOriginationInfo:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 108) |= 0x80u;
    *(_WORD *)(a1 + 108) |= 0x100u;
    objc_storeStrong((id *)(a1 + 88), a2);
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDMapsSearchHomeParameters;
  id v4 = [(GEOPDMapsSearchHomeParameters *)&v8 description];
  id v5 = [(GEOPDMapsSearchHomeParameters *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDMapsSearchHomeParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDMapsSearchHomeParameters readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(void *)(a1 + 32))
    {
      id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      objc_super v6 = (void *)(a1 + 24);
      if (*(void *)(a1 + 32))
      {
        unint64_t v7 = 0;
        do
        {
          uint64_t v8 = *(int *)(*v6 + 4 * v7);
          if (v8 >= 6)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
            v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v9 = off_1E53DCBE0[v8];
          }
          [v5 addObject:v9];

          ++v7;
          objc_super v6 = (void *)(a1 + 24);
        }
        while (v7 < *(void *)(a1 + 32));
      }
      if (a2) {
        v10 = @"supportedSectionType";
      }
      else {
        v10 = @"supported_section_type";
      }
      [v4 setObject:v5 forKey:v10];
    }
    -[GEOPDMapsSearchHomeParameters _readSearchBrowseCategorySuggestionParameters](a1);
    id v11 = *(id *)(a1 + 80);
    v12 = v11;
    if (v11)
    {
      if (a2)
      {
        v13 = [v11 jsonRepresentation];
        v14 = @"searchBrowseCategorySuggestionParameters";
      }
      else
      {
        v13 = [v11 dictionaryRepresentation];
        v14 = @"search_browse_category_suggestion_parameters";
      }
      [v4 setObject:v13 forKey:v14];
    }
    -[GEOPDMapsSearchHomeParameters _readCollectionSuggestionParameters](a1);
    id v15 = *(id *)(a1 + 48);
    v16 = v15;
    if (v15)
    {
      if (a2)
      {
        v17 = [v15 jsonRepresentation];
        v18 = @"collectionSuggestionParameters";
      }
      else
      {
        v17 = [v15 dictionaryRepresentation];
        v18 = @"collection_suggestion_parameters";
      }
      [v4 setObject:v17 forKey:v18];
    }
    -[GEOPDMapsSearchHomeParameters _readPublisherSuggestionParameters](a1);
    id v19 = *(id *)(a1 + 72);
    v20 = v19;
    if (v19)
    {
      if (a2)
      {
        v21 = [v19 jsonRepresentation];
        v22 = @"publisherSuggestionParameters";
      }
      else
      {
        v21 = [v19 dictionaryRepresentation];
        v22 = @"publisher_suggestion_parameters";
      }
      [v4 setObject:v21 forKey:v22];
    }
    -[GEOPDMapsSearchHomeParameters _readPlaceSuggestionParameters](a1);
    id v23 = *(id *)(a1 + 64);
    v24 = v23;
    if (v23)
    {
      if (a2)
      {
        v25 = [v23 jsonRepresentation];
        v26 = @"placeSuggestionParameters";
      }
      else
      {
        v25 = [v23 dictionaryRepresentation];
        v26 = @"place_suggestion_parameters";
      }
      [v4 setObject:v25 forKey:v26];
    }
    -[GEOPDMapsSearchHomeParameters _readGuidesLocationsSuggestionParameters](a1);
    id v27 = *(id *)(a1 + 56);
    v28 = v27;
    if (v27)
    {
      if (a2)
      {
        v29 = [v27 jsonRepresentation];
        v30 = @"guidesLocationsSuggestionParameters";
      }
      else
      {
        v29 = [v27 dictionaryRepresentation];
        v30 = @"guides_locations_suggestion_parameters";
      }
      [v4 setObject:v29 forKey:v30];
    }
    -[GEOPDMapsSearchHomeParameters _readSearchOriginationInfo](a1);
    id v31 = *(id *)(a1 + 88);
    v32 = v31;
    if (v31)
    {
      if (a2)
      {
        v33 = [v31 jsonRepresentation];
        v34 = @"searchOriginationInfo";
      }
      else
      {
        v33 = [v31 dictionaryRepresentation];
        v34 = @"search_origination_info";
      }
      [v4 setObject:v33 forKey:v34];
    }
    v35 = *(void **)(a1 + 16);
    if (v35)
    {
      v36 = [v35 dictionaryRepresentation];
      v37 = v36;
      if (a2)
      {
        v38 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v36, "count"));
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = __59__GEOPDMapsSearchHomeParameters__dictionaryRepresentation___block_invoke;
        v42[3] = &unk_1E53D8860;
        id v39 = v38;
        id v43 = v39;
        [v37 enumerateKeysAndObjectsUsingBlock:v42];
        id v40 = v39;

        v37 = v40;
      }
      [v4 setObject:v37 forKey:@"Unknown Fields"];
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
  return -[GEOPDMapsSearchHomeParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __59__GEOPDMapsSearchHomeParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  unint64_t v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    uint64_t v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    uint64_t v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDMapsSearchHomeParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEOPDMapsSearchHomeParametersIsDirty((uint64_t)self))
  {
    unint64_t v7 = self->_reader;
    objc_sync_enter(v7);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v9 writeData:v8];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDMapsSearchHomeParameters readAll:]((uint64_t)self, 0);
    id v5 = v9;
    if (self->_supportedSectionTypes.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        id v5 = v9;
        ++v6;
      }
      while (v6 < self->_supportedSectionTypes.count);
    }
    if (self->_searchBrowseCategorySuggestionParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v9;
    }
    if (self->_collectionSuggestionParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v9;
    }
    if (self->_publisherSuggestionParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v9;
    }
    if (self->_placeSuggestionParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v9;
    }
    if (self->_guidesLocationsSuggestionParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v9;
    }
    if (self->_searchOriginationInfo)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v9;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)result
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    id v3 = (uint64_t *)result;
    -[GEOPDMapsSearchHomeParameters _readCollectionSuggestionParameters](result);
    if (-[GEOPDCollectionSuggestionParameters hasGreenTeaWithValue:](v3[6], a2)) {
      return 1;
    }
    -[GEOPDMapsSearchHomeParameters _readGuidesLocationsSuggestionParameters]((uint64_t)v3);
    uint64_t v4 = v3[7];
    if (v4)
    {
      if ([*(id *)(v4 + 16) hasGreenTeaWithValue:a2]) {
        return 1;
      }
    }
    -[GEOPDMapsSearchHomeParameters _readPlaceSuggestionParameters]((uint64_t)v3);
    uint64_t v5 = v3[8];
    if (v5)
    {
      -[GEOPDPlaceSuggestionParameters _readSuggestedPlaceIds](v3[8]);
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v6 = *(id *)(v5 + 32);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v14;
        while (2)
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v14 != v9) {
              objc_enumerationMutation(v6);
            }
            if (objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "hasGreenTeaWithValue:", a2, (void)v13))
            {

              return 1;
            }
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }

      -[GEOPDPlaceSuggestionParameters _readViewportInfo](v5);
      if ([*(id *)(v5 + 40) hasGreenTeaWithValue:a2]) {
        return 1;
      }
    }
    -[GEOPDMapsSearchHomeParameters _readPublisherSuggestionParameters]((uint64_t)v3);
    uint64_t v11 = v3[9];
    if (v11)
    {
      if ([*(id *)(v11 + 24) hasGreenTeaWithValue:a2]) {
        return 1;
      }
    }
    -[GEOPDMapsSearchHomeParameters _readSearchBrowseCategorySuggestionParameters]((uint64_t)v3);
    if (-[GEOPDSearchBrowseCategorySuggestionParameters hasGreenTeaWithValue:](v3[10], a2))
    {
      return 1;
    }
    else
    {
      -[GEOPDMapsSearchHomeParameters _readSearchOriginationInfo]((uint64_t)v3);
      uint64_t v12 = v3[11];
      return -[GEOPDSearchOriginationInfo hasGreenTeaWithValue:](v12, a2);
    }
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  uint64_t v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDMapsSearchHomeParameters readAll:]((uint64_t)self, 0);
    PBRepeatedInt32Copy();
    id v8 = [(GEOPDSearchBrowseCategorySuggestionParameters *)self->_searchBrowseCategorySuggestionParameters copyWithZone:a3];
    uint64_t v9 = *(void **)(v5 + 80);
    *(void *)(v5 + 80) = v8;

    id v10 = [(GEOPDCollectionSuggestionParameters *)self->_collectionSuggestionParameters copyWithZone:a3];
    uint64_t v11 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v10;

    id v12 = [(GEOPDPublisherSuggestionParameters *)self->_publisherSuggestionParameters copyWithZone:a3];
    long long v13 = *(void **)(v5 + 72);
    *(void *)(v5 + 72) = v12;

    id v14 = [(GEOPDPlaceSuggestionParameters *)self->_placeSuggestionParameters copyWithZone:a3];
    long long v15 = *(void **)(v5 + 64);
    *(void *)(v5 + 64) = v14;

    id v16 = [(GEOPDGuidesLocationsSuggestionParameters *)self->_guidesLocationsSuggestionParameters copyWithZone:a3];
    v17 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v16;

    id v18 = [(GEOPDSearchOriginationInfo *)self->_searchOriginationInfo copyWithZone:a3];
    id v19 = *(void **)(v5 + 88);
    *(void *)(v5 + 88) = v18;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPDMapsSearchHomeParametersReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (-[GEOPDMapsSearchHomeParameters readAll:]((uint64_t)self, 1),
        -[GEOPDMapsSearchHomeParameters readAll:]((uint64_t)v4, 1),
        PBRepeatedInt32IsEqual())
    && ((searchBrowseCategorySuggestionParameters = self->_searchBrowseCategorySuggestionParameters,
         !((unint64_t)searchBrowseCategorySuggestionParameters | v4[10]))
     || -[GEOPDSearchBrowseCategorySuggestionParameters isEqual:](searchBrowseCategorySuggestionParameters, "isEqual:"))
    && ((collectionSuggestionParameters = self->_collectionSuggestionParameters,
         !((unint64_t)collectionSuggestionParameters | v4[6]))
     || -[GEOPDCollectionSuggestionParameters isEqual:](collectionSuggestionParameters, "isEqual:"))
    && ((publisherSuggestionParameters = self->_publisherSuggestionParameters,
         !((unint64_t)publisherSuggestionParameters | v4[9]))
     || -[GEOPDPublisherSuggestionParameters isEqual:](publisherSuggestionParameters, "isEqual:"))
    && ((placeSuggestionParameters = self->_placeSuggestionParameters,
         !((unint64_t)placeSuggestionParameters | v4[8]))
     || -[GEOPDPlaceSuggestionParameters isEqual:](placeSuggestionParameters, "isEqual:"))
    && ((guidesLocationsSuggestionParameters = self->_guidesLocationsSuggestionParameters,
         !((unint64_t)guidesLocationsSuggestionParameters | v4[7]))
     || -[GEOPDGuidesLocationsSuggestionParameters isEqual:](guidesLocationsSuggestionParameters, "isEqual:")))
  {
    searchOriginationInfo = self->_searchOriginationInfo;
    if ((unint64_t)searchOriginationInfo | v4[11]) {
      char v11 = -[GEOPDSearchOriginationInfo isEqual:](searchOriginationInfo, "isEqual:");
    }
    else {
      char v11 = 1;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  -[GEOPDMapsSearchHomeParameters readAll:]((uint64_t)self, 1);
  uint64_t v3 = PBRepeatedInt32Hash();
  unint64_t v4 = [(GEOPDSearchBrowseCategorySuggestionParameters *)self->_searchBrowseCategorySuggestionParameters hash] ^ v3;
  unint64_t v5 = [(GEOPDCollectionSuggestionParameters *)self->_collectionSuggestionParameters hash];
  unint64_t v6 = v4 ^ v5 ^ [(GEOPDPublisherSuggestionParameters *)self->_publisherSuggestionParameters hash];
  unint64_t v7 = [(GEOPDPlaceSuggestionParameters *)self->_placeSuggestionParameters hash];
  unint64_t v8 = v7 ^ [(GEOPDGuidesLocationsSuggestionParameters *)self->_guidesLocationsSuggestionParameters hash];
  return v6 ^ v8 ^ [(GEOPDSearchOriginationInfo *)self->_searchOriginationInfo hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchOriginationInfo, 0);
  objc_storeStrong((id *)&self->_searchBrowseCategorySuggestionParameters, 0);
  objc_storeStrong((id *)&self->_publisherSuggestionParameters, 0);
  objc_storeStrong((id *)&self->_placeSuggestionParameters, 0);
  objc_storeStrong((id *)&self->_guidesLocationsSuggestionParameters, 0);
  objc_storeStrong((id *)&self->_collectionSuggestionParameters, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end