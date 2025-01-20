@interface GEOPDSearchPlaceContextMetadata
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSearchPlaceContextMetadata)init;
- (GEOPDSearchPlaceContextMetadata)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_addNoFlagsAlternateSearchableName:(uint64_t)a1;
- (void)addAlternateSearchableName:(uint64_t)a1;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchPlaceContextMetadata

- (void)clearUnknownFields:(uint64_t)a1
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 108) |= 8u;
    *(_WORD *)(a1 + 108) |= 0x1000u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDSearchPlaceContextMetadata readAll:](a1, 0);
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v5 = *(id *)(a1 + 24);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v15;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v15 != v8) {
              objc_enumerationMutation(v5);
            }
            objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v9++), "clearUnknownFields:", 1, (void)v14);
          }
          while (v7 != v9);
          uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v7);
      }

      uint64_t v10 = *(void *)(a1 + 32);
      if (v10)
      {
        v11 = *(void **)(v10 + 8);
        *(void *)(v10 + 8) = 0;
      }
      uint64_t v12 = *(void *)(a1 + 64);
      if (v12)
      {
        v13 = *(void **)(v12 + 8);
        *(void *)(v12 + 8) = 0;
      }
    }
  }
}

- (GEOPDSearchPlaceContextMetadata)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchPlaceContextMetadata;
  v2 = [(GEOPDSearchPlaceContextMetadata *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchPlaceContextMetadata)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchPlaceContextMetadata;
  v3 = [(GEOPDSearchPlaceContextMetadata *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)addAlternateSearchableName:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 108) & 0x10) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchPlaceContextMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAlternateSearchableNames_tags_8428);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    -[GEOPDSearchPlaceContextMetadata _addNoFlagsAlternateSearchableName:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 108) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    *(_WORD *)(a1 + 108) |= 0x1000u;
  }
}

- (void)_addNoFlagsAlternateSearchableName:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 24);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v5;

      v4 = *(void **)(a1 + 24);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchPlaceContextMetadata;
  v4 = [(GEOPDSearchPlaceContextMetadata *)&v8 description];
  id v5 = [(GEOPDSearchPlaceContextMetadata *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchPlaceContextMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDSearchPlaceContextMetadata readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 108) & 0x100) == 0)
    {
      id v5 = *(void **)(a1 + 8);
      if (v5)
      {
        id v6 = v5;
        objc_sync_enter(v6);
        GEOPDSearchPlaceContextMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMatchedDisplayName_tags_8426);
        objc_sync_exit(v6);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    id v7 = *(id *)(a1 + 56);
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"matchedDisplayName";
      }
      else {
        objc_super v8 = @"matched_display_name";
      }
      [v4 setObject:v7 forKey:v8];
    }

    if ((*(_WORD *)(a1 + 108) & 2) != 0)
    {
      uint64_t v9 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 104)];
      if (a2) {
        uint64_t v10 = @"isDefaultName";
      }
      else {
        uint64_t v10 = @"is_default_name";
      }
      [v4 setObject:v9 forKey:v10];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 108) & 0x400) == 0)
    {
      v11 = *(void **)(a1 + 8);
      if (v11)
      {
        id v12 = v11;
        objc_sync_enter(v12);
        GEOPDSearchPlaceContextMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNormalizedQuery_tags_0);
        objc_sync_exit(v12);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    id v13 = *(id *)(a1 + 72);
    if (v13)
    {
      if (a2) {
        long long v14 = @"normalizedQuery";
      }
      else {
        long long v14 = @"normalized_query";
      }
      [v4 setObject:v13 forKey:v14];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 108) & 0x40) == 0)
    {
      long long v15 = *(void **)(a1 + 8);
      if (v15)
      {
        id v16 = v15;
        objc_sync_enter(v16);
        GEOPDSearchPlaceContextMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readInterpretedCategory_tags);
        objc_sync_exit(v16);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    id v17 = *(id *)(a1 + 40);
    if (v17)
    {
      if (a2) {
        v18 = @"interpretedCategory";
      }
      else {
        v18 = @"interpreted_category";
      }
      [v4 setObject:v17 forKey:v18];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 108) & 0x80) == 0)
    {
      uint64_t v19 = *(void **)(a1 + 8);
      if (v19)
      {
        id v20 = v19;
        objc_sync_enter(v20);
        GEOPDSearchPlaceContextMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMatchedDisplayNameLanguageCode_tags_8427);
        objc_sync_exit(v20);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    id v21 = *(id *)(a1 + 48);
    if (v21)
    {
      if (a2) {
        v22 = @"matchedDisplayNameLanguageCode";
      }
      else {
        v22 = @"matched_display_name_language_code";
      }
      [v4 setObject:v21 forKey:v22];
    }

    if ([*(id *)(a1 + 24) count])
    {
      v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v61 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      id v24 = *(id *)(a1 + 24);
      uint64_t v25 = [v24 countByEnumeratingWithState:&v61 objects:v65 count:16];
      if (v25)
      {
        uint64_t v26 = *(void *)v62;
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v62 != v26) {
              objc_enumerationMutation(v24);
            }
            v28 = *(void **)(*((void *)&v61 + 1) + 8 * i);
            if (a2) {
              [v28 jsonRepresentation];
            }
            else {
            v29 = [v28 dictionaryRepresentation];
            }
            [v23 addObject:v29];
          }
          uint64_t v25 = [v24 countByEnumeratingWithState:&v61 objects:v65 count:16];
        }
        while (v25);
      }

      if (a2) {
        v30 = @"alternateSearchableName";
      }
      else {
        v30 = @"alternate_searchable_name";
      }
      [v4 setObject:v23 forKey:v30];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 108) & 0x800) == 0)
    {
      v31 = *(void **)(a1 + 8);
      if (v31)
      {
        id v32 = v31;
        objc_sync_enter(v32);
        GEOPDSearchPlaceContextMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSecondaryNameOverrideLanguage_tags);
        objc_sync_exit(v32);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    id v33 = *(id *)(a1 + 80);
    if (v33)
    {
      if (a2) {
        v34 = @"secondaryNameOverrideLanguage";
      }
      else {
        v34 = @"secondary_name_override_language";
      }
      [v4 setObject:v33 forKey:v34];
    }

    if (*(_WORD *)(a1 + 108))
    {
      int v35 = *(_DWORD *)(a1 + 100);
      if (v35)
      {
        if (v35 == 1)
        {
          v36 = @"CATEGORY_TAXONOMY_TYPE_MODERN";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 100));
          v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v36 = @"CATEGORY_TAXONOMY_TYPE_DEFAULT";
      }
      if (a2) {
        v37 = @"taxonomyTypeForClientization";
      }
      else {
        v37 = @"taxonomy_type_for_clientization";
      }
      [v4 setObject:v36 forKey:v37];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 108) & 0x20) == 0)
    {
      v38 = *(void **)(a1 + 8);
      if (v38)
      {
        id v39 = v38;
        objc_sync_enter(v39);
        GEOPDSearchPlaceContextMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readContextualPhotoMetadata_tags);
        objc_sync_exit(v39);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    id v40 = *(id *)(a1 + 32);
    v41 = v40;
    if (v40)
    {
      if (a2)
      {
        v42 = [v40 jsonRepresentation];
        v43 = @"contextualPhotoMetadata";
      }
      else
      {
        v42 = [v40 dictionaryRepresentation];
        v43 = @"contextual_photo_metadata";
      }
      [v4 setObject:v42 forKey:v43];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 108) & 0x200) == 0)
    {
      v44 = *(void **)(a1 + 8);
      if (v44)
      {
        id v45 = v44;
        objc_sync_enter(v45);
        GEOPDSearchPlaceContextMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNearbyPlacesMetadata_tags);
        objc_sync_exit(v45);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    id v46 = *(id *)(a1 + 64);
    v47 = v46;
    if (v46)
    {
      if (a2)
      {
        v48 = [v46 jsonRepresentation];
        v49 = @"nearbyPlacesMetadata";
      }
      else
      {
        v48 = [v46 dictionaryRepresentation];
        v49 = @"nearby_places_metadata";
      }
      [v4 setObject:v48 forKey:v49];
    }
    if ((*(_WORD *)(a1 + 108) & 4) != 0)
    {
      v50 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 105)];
      if (a2) {
        v51 = @"shouldPartiallyClientizeResult";
      }
      else {
        v51 = @"should_partially_clientize_result";
      }
      [v4 setObject:v50 forKey:v51];
    }
    v52 = *(void **)(a1 + 16);
    if (v52)
    {
      v53 = [v52 dictionaryRepresentation];
      v54 = v53;
      if (a2)
      {
        v55 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v53, "count"));
        v59[0] = MEMORY[0x1E4F143A8];
        v59[1] = 3221225472;
        v59[2] = __61__GEOPDSearchPlaceContextMetadata__dictionaryRepresentation___block_invoke;
        v59[3] = &unk_1E53D8860;
        id v56 = v55;
        id v60 = v56;
        [v54 enumerateKeysAndObjectsUsingBlock:v59];
        id v57 = v56;
      }
      else
      {
        id v57 = v53;
      }
      [v4 setObject:v57 forKey:@"Unknown Fields"];
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
  return -[GEOPDSearchPlaceContextMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_8467;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_8468;
      }
      GEOPDSearchPlaceContextMetadataReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDSearchPlaceContextMetadataCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

void __61__GEOPDSearchPlaceContextMetadata__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
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
  return GEOPDSearchPlaceContextMetadataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x1FF0) == 0))
  {
    id v10 = self->_reader;
    objc_sync_enter(v10);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v11];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchPlaceContextMetadata readAll:]((uint64_t)self, 0);
    if (self->_matchedDisplayName) {
      PBDataWriterWriteStringField();
    }
    if ((*(_WORD *)&self->_flags & 2) != 0) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_normalizedQuery) {
      PBDataWriterWriteStringField();
    }
    if (self->_interpretedCategory) {
      PBDataWriterWriteStringField();
    }
    if (self->_matchedDisplayNameLanguageCode) {
      PBDataWriterWriteStringField();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = self->_alternateSearchableNames;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    if (self->_secondaryNameOverrideLanguage) {
      PBDataWriterWriteStringField();
    }
    if (*(_WORD *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_contextualPhotoMetadata) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_nearbyPlacesMetadata) {
      PBDataWriterWriteSubmessage();
    }
    if ((*(_WORD *)&self->_flags & 4) != 0) {
      PBDataWriterWriteBOOLField();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x1000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDSearchPlaceContextMetadataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_19;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchPlaceContextMetadata readAll:]((uint64_t)self, 0);
  uint64_t v9 = [(NSString *)self->_matchedDisplayName copyWithZone:a3];
  id v10 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v9;

  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(unsigned char *)(v5 + 104) = self->_isDefaultName;
    *(_WORD *)(v5 + 108) |= 2u;
  }
  uint64_t v11 = [(NSString *)self->_normalizedQuery copyWithZone:a3];
  long long v12 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v11;

  uint64_t v13 = [(NSString *)self->_interpretedCategory copyWithZone:a3];
  long long v14 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v13;

  uint64_t v15 = [(NSString *)self->_matchedDisplayNameLanguageCode copyWithZone:a3];
  id v16 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v15;

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v17 = self->_alternateSearchableNames;
  uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v31 != v19) {
          objc_enumerationMutation(v17);
        }
        id v21 = objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * i), "copyWithZone:", a3, (void)v30);
        -[GEOPDSearchPlaceContextMetadata addAlternateSearchableName:](v5, v21);
      }
      uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v18);
  }

  uint64_t v22 = [(NSString *)self->_secondaryNameOverrideLanguage copyWithZone:a3];
  v23 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v22;

  if (*(_WORD *)&self->_flags)
  {
    *(_DWORD *)(v5 + 100) = self->_taxonomyTypeForClientization;
    *(_WORD *)(v5 + 108) |= 1u;
  }
  id v24 = -[GEOPDContextualPhotoMetadata copyWithZone:](self->_contextualPhotoMetadata, "copyWithZone:", a3, (void)v30);
  uint64_t v25 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v24;

  id v26 = [(GEOPDNearbyPlacesMetadata *)self->_nearbyPlacesMetadata copyWithZone:a3];
  v27 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v26;

  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *(unsigned char *)(v5 + 105) = self->_shouldPartiallyClientizeResult;
    *(_WORD *)(v5 + 108) |= 4u;
  }
  v28 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v28;
LABEL_19:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_33;
  }
  -[GEOPDSearchPlaceContextMetadata readAll:]((uint64_t)self, 1);
  -[GEOPDSearchPlaceContextMetadata readAll:]((uint64_t)v4, 1);
  matchedDisplayName = self->_matchedDisplayName;
  if ((unint64_t)matchedDisplayName | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](matchedDisplayName, "isEqual:")) {
      goto LABEL_33;
    }
  }
  __int16 v6 = *((_WORD *)v4 + 54);
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    if ((v6 & 2) == 0) {
      goto LABEL_33;
    }
    if (self->_isDefaultName)
    {
      if (!*((unsigned char *)v4 + 104)) {
        goto LABEL_33;
      }
    }
    else if (*((unsigned char *)v4 + 104))
    {
      goto LABEL_33;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_33;
  }
  normalizedQuery = self->_normalizedQuery;
  if ((unint64_t)normalizedQuery | *((void *)v4 + 9)
    && !-[NSString isEqual:](normalizedQuery, "isEqual:"))
  {
    goto LABEL_33;
  }
  interpretedCategory = self->_interpretedCategory;
  if ((unint64_t)interpretedCategory | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](interpretedCategory, "isEqual:")) {
      goto LABEL_33;
    }
  }
  matchedDisplayNameLanguageCode = self->_matchedDisplayNameLanguageCode;
  if ((unint64_t)matchedDisplayNameLanguageCode | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](matchedDisplayNameLanguageCode, "isEqual:")) {
      goto LABEL_33;
    }
  }
  alternateSearchableNames = self->_alternateSearchableNames;
  if ((unint64_t)alternateSearchableNames | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](alternateSearchableNames, "isEqual:")) {
      goto LABEL_33;
    }
  }
  secondaryNameOverrideLanguage = self->_secondaryNameOverrideLanguage;
  if ((unint64_t)secondaryNameOverrideLanguage | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](secondaryNameOverrideLanguage, "isEqual:")) {
      goto LABEL_33;
    }
  }
  __int16 v12 = *((_WORD *)v4 + 54);
  if (*(_WORD *)&self->_flags)
  {
    if ((v12 & 1) == 0 || self->_taxonomyTypeForClientization != *((_DWORD *)v4 + 25)) {
      goto LABEL_33;
    }
  }
  else if (v12)
  {
    goto LABEL_33;
  }
  contextualPhotoMetadata = self->_contextualPhotoMetadata;
  if ((unint64_t)contextualPhotoMetadata | *((void *)v4 + 4)
    && !-[GEOPDContextualPhotoMetadata isEqual:](contextualPhotoMetadata, "isEqual:"))
  {
    goto LABEL_33;
  }
  nearbyPlacesMetadata = self->_nearbyPlacesMetadata;
  if ((unint64_t)nearbyPlacesMetadata | *((void *)v4 + 8))
  {
    if (!-[GEOPDNearbyPlacesMetadata isEqual:](nearbyPlacesMetadata, "isEqual:")) {
      goto LABEL_33;
    }
  }
  __int16 v15 = *((_WORD *)v4 + 54);
  BOOL v16 = (v15 & 4) == 0;
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    if ((v15 & 4) != 0)
    {
      if (self->_shouldPartiallyClientizeResult)
      {
        if (!*((unsigned char *)v4 + 105)) {
          goto LABEL_33;
        }
      }
      else if (*((unsigned char *)v4 + 105))
      {
        goto LABEL_33;
      }
      BOOL v16 = 1;
      goto LABEL_34;
    }
LABEL_33:
    BOOL v16 = 0;
  }
LABEL_34:

  return v16;
}

- (unint64_t)hash
{
  -[GEOPDSearchPlaceContextMetadata readAll:]((uint64_t)self, 1);
  NSUInteger v14 = [(NSString *)self->_matchedDisplayName hash];
  if ((*(_WORD *)&self->_flags & 2) != 0) {
    uint64_t v13 = 2654435761 * self->_isDefaultName;
  }
  else {
    uint64_t v13 = 0;
  }
  NSUInteger v12 = [(NSString *)self->_normalizedQuery hash];
  NSUInteger v3 = [(NSString *)self->_interpretedCategory hash];
  NSUInteger v4 = [(NSString *)self->_matchedDisplayNameLanguageCode hash];
  uint64_t v5 = [(NSMutableArray *)self->_alternateSearchableNames hash];
  NSUInteger v6 = [(NSString *)self->_secondaryNameOverrideLanguage hash];
  if (*(_WORD *)&self->_flags) {
    uint64_t v7 = 2654435761 * self->_taxonomyTypeForClientization;
  }
  else {
    uint64_t v7 = 0;
  }
  unint64_t v8 = [(GEOPDContextualPhotoMetadata *)self->_contextualPhotoMetadata hash];
  unint64_t v9 = [(GEOPDNearbyPlacesMetadata *)self->_nearbyPlacesMetadata hash];
  if ((*(_WORD *)&self->_flags & 4) != 0) {
    uint64_t v10 = 2654435761 * self->_shouldPartiallyClientizeResult;
  }
  else {
    uint64_t v10 = 0;
  }
  return v13 ^ v14 ^ v12 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryNameOverrideLanguage, 0);
  objc_storeStrong((id *)&self->_normalizedQuery, 0);
  objc_storeStrong((id *)&self->_nearbyPlacesMetadata, 0);
  objc_storeStrong((id *)&self->_matchedDisplayName, 0);
  objc_storeStrong((id *)&self->_matchedDisplayNameLanguageCode, 0);
  objc_storeStrong((id *)&self->_interpretedCategory, 0);
  objc_storeStrong((id *)&self->_contextualPhotoMetadata, 0);
  objc_storeStrong((id *)&self->_alternateSearchableNames, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end