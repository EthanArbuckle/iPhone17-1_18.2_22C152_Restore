@interface GEOPDAutocompletePlaceContextMetadata
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDAutocompletePlaceContextMetadata)init;
- (GEOPDAutocompletePlaceContextMetadata)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_addNoFlagsAlternateSearchableName:(uint64_t)a1;
- (void)addAlternateSearchableName:(uint64_t)a1;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)dealloc;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDAutocompletePlaceContextMetadata

- (GEOPDAutocompletePlaceContextMetadata)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDAutocompletePlaceContextMetadata;
  v2 = [(GEOPDAutocompletePlaceContextMetadata *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDAutocompletePlaceContextMetadata)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDAutocompletePlaceContextMetadata;
  v3 = [(GEOPDAutocompletePlaceContextMetadata *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDAutocompletePlaceContextMetadata;
  [(GEOPDAutocompletePlaceContextMetadata *)&v3 dealloc];
}

- (void)addAlternateSearchableName:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 113) & 0x20) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDAutocompletePlaceContextMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAlternateSearchableNames_tags);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    -[GEOPDAutocompletePlaceContextMetadata _addNoFlagsAlternateSearchableName:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_DWORD *)(a1 + 112) |= 0x2000u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    *(_DWORD *)(a1 + 112) |= 0x20000u;
  }
}

- (void)_addNoFlagsAlternateSearchableName:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 48);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v5;

      v4 = *(void **)(a1 + 48);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDAutocompletePlaceContextMetadata;
  v4 = [(GEOPDAutocompletePlaceContextMetadata *)&v8 description];
  id v5 = [(GEOPDAutocompletePlaceContextMetadata *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAutocompletePlaceContextMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDAutocompletePlaceContextMetadata readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 114) & 1) == 0)
    {
      id v5 = *(void **)(a1 + 8);
      if (v5)
      {
        id v6 = v5;
        objc_sync_enter(v6);
        GEOPDAutocompletePlaceContextMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMatchedDisplayName_tags);
        objc_sync_exit(v6);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    id v7 = *(id *)(a1 + 72);
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

    int v9 = *(_DWORD *)(a1 + 112);
    if ((v9 & 0x20) != 0)
    {
      v10 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 106)];
      if (a2) {
        v11 = @"isDefaultName";
      }
      else {
        v11 = @"is_default_name";
      }
      [v4 setObject:v10 forKey:v11];

      int v9 = *(_DWORD *)(a1 + 112);
    }
    if ((v9 & 0x80) != 0)
    {
      v12 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 108)];
      if (a2) {
        v13 = @"isProminentResult";
      }
      else {
        v13 = @"is_prominent_result";
      }
      [v4 setObject:v12 forKey:v13];
    }
    if (*(void *)(a1 + 32))
    {
      v14 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      v15 = (void *)(a1 + 24);
      if (*(void *)(a1 + 32))
      {
        unint64_t v16 = 0;
        do
        {
          uint64_t v17 = *(int *)(*v15 + 4 * v16);
          if (v17 >= 5)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v17);
            v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v18 = off_1E53E3698[v17];
          }
          [v14 addObject:v18];

          ++v16;
          v15 = (void *)(a1 + 24);
        }
        while (v16 < *(void *)(a1 + 32));
      }
      if (a2) {
        v19 = @"clientizationFeature";
      }
      else {
        v19 = @"clientization_feature";
      }
      [v4 setObject:v14 forKey:v19];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 113) & 0x80) == 0)
    {
      v20 = *(void **)(a1 + 8);
      if (v20)
      {
        id v21 = v20;
        objc_sync_enter(v21);
        GEOPDAutocompletePlaceContextMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMatchedDisplayNameLanguageCode_tags);
        objc_sync_exit(v21);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    id v22 = *(id *)(a1 + 64);
    if (v22)
    {
      if (a2) {
        v23 = @"matchedDisplayNameLanguageCode";
      }
      else {
        v23 = @"matched_display_name_language_code";
      }
      [v4 setObject:v22 forKey:v23];
    }

    int v24 = *(_DWORD *)(a1 + 112);
    if ((v24 & 0x400) != 0)
    {
      v25 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 111)];
      if (a2) {
        v26 = @"shouldSuppressDirectionsAction";
      }
      else {
        v26 = @"should_suppress_directions_action";
      }
      [v4 setObject:v25 forKey:v26];

      int v24 = *(_DWORD *)(a1 + 112);
    }
    if ((v24 & 0x40) != 0)
    {
      v27 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 107)];
      if (a2) {
        v28 = @"isLookAroundActionAllowed";
      }
      else {
        v28 = @"is_look_around_action_allowed";
      }
      [v4 setObject:v27 forKey:v28];
    }
    if ([*(id *)(a1 + 48) count])
    {
      v29 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
      long long v67 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      id v30 = *(id *)(a1 + 48);
      uint64_t v31 = [v30 countByEnumeratingWithState:&v67 objects:v71 count:16];
      if (v31)
      {
        uint64_t v32 = *(void *)v68;
        do
        {
          for (uint64_t i = 0; i != v31; ++i)
          {
            if (*(void *)v68 != v32) {
              objc_enumerationMutation(v30);
            }
            v34 = *(void **)(*((void *)&v67 + 1) + 8 * i);
            if (a2) {
              [v34 jsonRepresentation];
            }
            else {
            v35 = [v34 dictionaryRepresentation];
            }
            [v29 addObject:v35];
          }
          uint64_t v31 = [v30 countByEnumeratingWithState:&v67 objects:v71 count:16];
        }
        while (v31);
      }

      if (a2) {
        v36 = @"alternateSearchableName";
      }
      else {
        v36 = @"alternate_searchable_name";
      }
      [v4 setObject:v29 forKey:v36];
    }
    int v37 = *(_DWORD *)(a1 + 112);
    if (v37)
    {
      v38 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 92)];
      if (a2) {
        v39 = @"distanceDisplayThreshold";
      }
      else {
        v39 = @"distance_display_threshold";
      }
      [v4 setObject:v38 forKey:v39];

      int v37 = *(_DWORD *)(a1 + 112);
    }
    if ((v37 & 0x10) != 0)
    {
      v40 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 105)];
      if (a2) {
        v41 = @"enableLookInsideActionForVenuePois";
      }
      else {
        v41 = @"enable_look_inside_action_for_venue_pois";
      }
      [v4 setObject:v40 forKey:v41];

      int v37 = *(_DWORD *)(a1 + 112);
    }
    if ((v37 & 8) != 0)
    {
      v42 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 104)];
      if (a2) {
        v43 = @"enableChildPoisWithoutAcRank";
      }
      else {
        v43 = @"enable_child_pois_without_ac_rank";
      }
      [v4 setObject:v42 forKey:v43];

      int v37 = *(_DWORD *)(a1 + 112);
    }
    if ((v37 & 2) != 0)
    {
      uint64_t v44 = *(int *)(a1 + 96);
      if (v44 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 96));
        v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v45 = off_1E53E36C0[v44];
      }
      if (a2) {
        v46 = @"requestedShortAddressType";
      }
      else {
        v46 = @"requested_short_address_type";
      }
      [v4 setObject:v45 forKey:v46];

      int v37 = *(_DWORD *)(a1 + 112);
    }
    if ((v37 & 0x100) != 0)
    {
      v47 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 109)];
      if (a2) {
        v48 = @"shouldEnableCallAction";
      }
      else {
        v48 = @"should_enable_call_action";
      }
      [v4 setObject:v47 forKey:v48];

      int v37 = *(_DWORD *)(a1 + 112);
    }
    if ((v37 & 0x200) != 0)
    {
      v49 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 110)];
      if (a2) {
        v50 = @"shouldEnableWebsiteAction";
      }
      else {
        v50 = @"should_enable_website_action";
      }
      [v4 setObject:v49 forKey:v50];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 113) & 0x40) == 0)
    {
      v51 = *(void **)(a1 + 8);
      if (v51)
      {
        id v52 = v51;
        objc_sync_enter(v52);
        GEOPDAutocompletePlaceContextMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readInferredCategory_tags);
        objc_sync_exit(v52);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    id v53 = *(id *)(a1 + 56);
    if (v53)
    {
      if (a2) {
        v54 = @"inferredCategory";
      }
      else {
        v54 = @"inferred_category";
      }
      [v4 setObject:v53 forKey:v54];
    }

    if ((*(unsigned char *)(a1 + 112) & 4) != 0)
    {
      int v55 = *(_DWORD *)(a1 + 100);
      if (v55)
      {
        if (v55 == 1)
        {
          v56 = @"CATEGORY_TAXONOMY_TYPE_MODERN";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 100));
          v56 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v56 = @"CATEGORY_TAXONOMY_TYPE_DEFAULT";
      }
      if (a2) {
        v57 = @"taxonomyTypeForClientization";
      }
      else {
        v57 = @"taxonomy_type_for_clientization";
      }
      [v4 setObject:v56 forKey:v57];
    }
    v58 = *(void **)(a1 + 16);
    if (v58)
    {
      v59 = [v58 dictionaryRepresentation];
      v60 = v59;
      if (a2)
      {
        v61 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v59, "count"));
        v65[0] = MEMORY[0x1E4F143A8];
        v65[1] = 3221225472;
        v65[2] = __67__GEOPDAutocompletePlaceContextMetadata__dictionaryRepresentation___block_invoke;
        v65[3] = &unk_1E53D8860;
        id v62 = v61;
        id v66 = v62;
        [v60 enumerateKeysAndObjectsUsingBlock:v65];
        id v63 = v62;
      }
      else
      {
        id v63 = v59;
      }
      [v4 setObject:v63 forKey:@"Unknown Fields"];
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
  return -[GEOPDAutocompletePlaceContextMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_737;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_738;
      }
      GEOPDAutocompletePlaceContextMetadataReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDAutocompletePlaceContextMetadataCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

void __67__GEOPDAutocompletePlaceContextMetadata__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    int v9 = [v10 description];
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
  return GEOPDAutocompletePlaceContextMetadataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_DWORD *)&self->_flags & 0x3F000) == 0))
  {
    v14 = self->_reader;
    objc_sync_enter(v14);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v15 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v15];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v14);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDAutocompletePlaceContextMetadata readAll:]((uint64_t)self, 0);
    if (self->_matchedDisplayName) {
      PBDataWriterWriteStringField();
    }
    $203C1FB2D65701EB3B32EE8DA255F10E flags = self->_flags;
    if ((*(unsigned char *)&flags & 0x20) != 0)
    {
      PBDataWriterWriteBOOLField();
      $203C1FB2D65701EB3B32EE8DA255F10E flags = self->_flags;
    }
    if ((*(unsigned char *)&flags & 0x80) != 0) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_clientizationFeatures.count)
    {
      unint64_t v7 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v7;
      }
      while (v7 < self->_clientizationFeatures.count);
    }
    if (self->_matchedDisplayNameLanguageCode) {
      PBDataWriterWriteStringField();
    }
    $203C1FB2D65701EB3B32EE8DA255F10E v8 = self->_flags;
    if ((*(_WORD *)&v8 & 0x400) != 0)
    {
      PBDataWriterWriteBOOLField();
      $203C1FB2D65701EB3B32EE8DA255F10E v8 = self->_flags;
    }
    if ((*(unsigned char *)&v8 & 0x40) != 0) {
      PBDataWriterWriteBOOLField();
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    int v9 = self->_alternateSearchableNames;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v9);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }

    $203C1FB2D65701EB3B32EE8DA255F10E v13 = self->_flags;
    if (*(unsigned char *)&v13)
    {
      PBDataWriterWriteUint32Field();
      $203C1FB2D65701EB3B32EE8DA255F10E v13 = self->_flags;
    }
    if ((*(unsigned char *)&v13 & 0x10) != 0)
    {
      PBDataWriterWriteBOOLField();
      $203C1FB2D65701EB3B32EE8DA255F10E v13 = self->_flags;
    }
    if ((*(unsigned char *)&v13 & 8) != 0)
    {
      PBDataWriterWriteBOOLField();
      $203C1FB2D65701EB3B32EE8DA255F10E v13 = self->_flags;
    }
    if ((*(unsigned char *)&v13 & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      $203C1FB2D65701EB3B32EE8DA255F10E v13 = self->_flags;
    }
    if ((*(_WORD *)&v13 & 0x100) != 0)
    {
      PBDataWriterWriteBOOLField();
      $203C1FB2D65701EB3B32EE8DA255F10E v13 = self->_flags;
    }
    if ((*(_WORD *)&v13 & 0x200) != 0) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_inferredCategory) {
      PBDataWriterWriteStringField();
    }
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      PBDataWriterWriteInt32Field();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v16);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*((unsigned char *)&self->_flags + 2) & 2) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDAutocompletePlaceContextMetadataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_30;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDAutocompletePlaceContextMetadata readAll:]((uint64_t)self, 0);
  uint64_t v9 = [(NSString *)self->_matchedDisplayName copyWithZone:a3];
  uint64_t v10 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v9;

  $203C1FB2D65701EB3B32EE8DA255F10E flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    *(unsigned char *)(v5 + 106) = self->_isDefaultName;
    *(_DWORD *)(v5 + 112) |= 0x20u;
    $203C1FB2D65701EB3B32EE8DA255F10E flags = self->_flags;
  }
  if ((*(unsigned char *)&flags & 0x80) != 0)
  {
    *(unsigned char *)(v5 + 108) = self->_isProminentResult;
    *(_DWORD *)(v5 + 112) |= 0x80u;
  }
  PBRepeatedInt32Copy();
  uint64_t v12 = [(NSString *)self->_matchedDisplayNameLanguageCode copyWithZone:a3];
  $203C1FB2D65701EB3B32EE8DA255F10E v13 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v12;

  $203C1FB2D65701EB3B32EE8DA255F10E v14 = self->_flags;
  if ((*(_WORD *)&v14 & 0x400) != 0)
  {
    *(unsigned char *)(v5 + 111) = self->_shouldSuppressDirectionsAction;
    *(_DWORD *)(v5 + 112) |= 0x400u;
    $203C1FB2D65701EB3B32EE8DA255F10E v14 = self->_flags;
  }
  if ((*(unsigned char *)&v14 & 0x40) != 0)
  {
    *(unsigned char *)(v5 + 107) = self->_isLookAroundActionAllowed;
    *(_DWORD *)(v5 + 112) |= 0x40u;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v15 = self->_alternateSearchableNames;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v15);
        }
        long long v19 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * i), "copyWithZone:", a3, (void)v25);
        -[GEOPDAutocompletePlaceContextMetadata addAlternateSearchableName:](v5, v19);
      }
      uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v16);
  }

  $203C1FB2D65701EB3B32EE8DA255F10E v20 = self->_flags;
  if (*(unsigned char *)&v20)
  {
    *(_DWORD *)(v5 + 92) = self->_distanceDisplayThreshold;
    *(_DWORD *)(v5 + 112) |= 1u;
    $203C1FB2D65701EB3B32EE8DA255F10E v20 = self->_flags;
    if ((*(unsigned char *)&v20 & 0x10) == 0)
    {
LABEL_22:
      if ((*(unsigned char *)&v20 & 8) == 0) {
        goto LABEL_23;
      }
      goto LABEL_33;
    }
  }
  else if ((*(unsigned char *)&v20 & 0x10) == 0)
  {
    goto LABEL_22;
  }
  *(unsigned char *)(v5 + 105) = self->_enableLookInsideActionForVenuePois;
  *(_DWORD *)(v5 + 112) |= 0x10u;
  $203C1FB2D65701EB3B32EE8DA255F10E v20 = self->_flags;
  if ((*(unsigned char *)&v20 & 8) == 0)
  {
LABEL_23:
    if ((*(unsigned char *)&v20 & 2) == 0) {
      goto LABEL_24;
    }
    goto LABEL_34;
  }
LABEL_33:
  *(unsigned char *)(v5 + 104) = self->_enableChildPoisWithoutAcRank;
  *(_DWORD *)(v5 + 112) |= 8u;
  $203C1FB2D65701EB3B32EE8DA255F10E v20 = self->_flags;
  if ((*(unsigned char *)&v20 & 2) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v20 & 0x100) == 0) {
      goto LABEL_25;
    }
LABEL_35:
    *(unsigned char *)(v5 + 109) = self->_shouldEnableCallAction;
    *(_DWORD *)(v5 + 112) |= 0x100u;
    if ((*(_DWORD *)&self->_flags & 0x200) == 0) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
LABEL_34:
  *(_DWORD *)(v5 + 96) = self->_requestedShortAddressType;
  *(_DWORD *)(v5 + 112) |= 2u;
  $203C1FB2D65701EB3B32EE8DA255F10E v20 = self->_flags;
  if ((*(_WORD *)&v20 & 0x100) != 0) {
    goto LABEL_35;
  }
LABEL_25:
  if ((*(_WORD *)&v20 & 0x200) != 0)
  {
LABEL_26:
    *(unsigned char *)(v5 + 110) = self->_shouldEnableWebsiteAction;
    *(_DWORD *)(v5 + 112) |= 0x200u;
  }
LABEL_27:
  uint64_t v21 = -[NSString copyWithZone:](self->_inferredCategory, "copyWithZone:", a3, (void)v25);
  id v22 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v21;

  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 100) = self->_taxonomyTypeForClientization;
    *(_DWORD *)(v5 + 112) |= 4u;
  }
  v23 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v23;
LABEL_30:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_92;
  }
  -[GEOPDAutocompletePlaceContextMetadata readAll:]((uint64_t)self, 1);
  -[GEOPDAutocompletePlaceContextMetadata readAll:]((uint64_t)v4, 1);
  matchedDisplayName = self->_matchedDisplayName;
  if ((unint64_t)matchedDisplayName | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](matchedDisplayName, "isEqual:")) {
      goto LABEL_92;
    }
  }
  $203C1FB2D65701EB3B32EE8DA255F10E flags = self->_flags;
  int v7 = *((_DWORD *)v4 + 28);
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0) {
      goto LABEL_92;
    }
    if (self->_isDefaultName)
    {
      if (!*((unsigned char *)v4 + 106)) {
        goto LABEL_92;
      }
    }
    else if (*((unsigned char *)v4 + 106))
    {
      goto LABEL_92;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_92;
  }
  if ((*(unsigned char *)&flags & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0) {
      goto LABEL_92;
    }
    if (self->_isProminentResult)
    {
      if (!*((unsigned char *)v4 + 108)) {
        goto LABEL_92;
      }
    }
    else if (*((unsigned char *)v4 + 108))
    {
      goto LABEL_92;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_92;
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_92;
  }
  matchedDisplayNameLanguageCode = self->_matchedDisplayNameLanguageCode;
  if ((unint64_t)matchedDisplayNameLanguageCode | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](matchedDisplayNameLanguageCode, "isEqual:")) {
      goto LABEL_92;
    }
  }
  $203C1FB2D65701EB3B32EE8DA255F10E v9 = self->_flags;
  int v10 = *((_DWORD *)v4 + 28);
  if ((*(_WORD *)&v9 & 0x400) != 0)
  {
    if ((v10 & 0x400) == 0) {
      goto LABEL_92;
    }
    if (self->_shouldSuppressDirectionsAction)
    {
      if (!*((unsigned char *)v4 + 111)) {
        goto LABEL_92;
      }
    }
    else if (*((unsigned char *)v4 + 111))
    {
      goto LABEL_92;
    }
  }
  else if ((v10 & 0x400) != 0)
  {
    goto LABEL_92;
  }
  if ((*(unsigned char *)&v9 & 0x40) != 0)
  {
    if ((v10 & 0x40) == 0) {
      goto LABEL_92;
    }
    if (self->_isLookAroundActionAllowed)
    {
      if (!*((unsigned char *)v4 + 107)) {
        goto LABEL_92;
      }
    }
    else if (*((unsigned char *)v4 + 107))
    {
      goto LABEL_92;
    }
  }
  else if ((v10 & 0x40) != 0)
  {
    goto LABEL_92;
  }
  alternateSearchableNames = self->_alternateSearchableNames;
  if ((unint64_t)alternateSearchableNames | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](alternateSearchableNames, "isEqual:")) {
      goto LABEL_92;
    }
    $203C1FB2D65701EB3B32EE8DA255F10E v9 = self->_flags;
    int v10 = *((_DWORD *)v4 + 28);
  }
  if (*(unsigned char *)&v9)
  {
    if ((v10 & 1) == 0 || self->_distanceDisplayThreshold != *((_DWORD *)v4 + 23)) {
      goto LABEL_92;
    }
  }
  else if (v10)
  {
    goto LABEL_92;
  }
  if ((*(unsigned char *)&v9 & 0x10) != 0)
  {
    if ((v10 & 0x10) == 0) {
      goto LABEL_92;
    }
    if (self->_enableLookInsideActionForVenuePois)
    {
      if (!*((unsigned char *)v4 + 105)) {
        goto LABEL_92;
      }
    }
    else if (*((unsigned char *)v4 + 105))
    {
      goto LABEL_92;
    }
  }
  else if ((v10 & 0x10) != 0)
  {
    goto LABEL_92;
  }
  if ((*(unsigned char *)&v9 & 8) != 0)
  {
    if ((v10 & 8) == 0) {
      goto LABEL_92;
    }
    if (self->_enableChildPoisWithoutAcRank)
    {
      if (!*((unsigned char *)v4 + 104)) {
        goto LABEL_92;
      }
    }
    else if (*((unsigned char *)v4 + 104))
    {
      goto LABEL_92;
    }
  }
  else if ((v10 & 8) != 0)
  {
    goto LABEL_92;
  }
  if ((*(unsigned char *)&v9 & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_requestedShortAddressType != *((_DWORD *)v4 + 24)) {
      goto LABEL_92;
    }
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_92;
  }
  if ((*(_WORD *)&v9 & 0x100) != 0)
  {
    if ((v10 & 0x100) == 0) {
      goto LABEL_92;
    }
    if (self->_shouldEnableCallAction)
    {
      if (!*((unsigned char *)v4 + 109)) {
        goto LABEL_92;
      }
    }
    else if (*((unsigned char *)v4 + 109))
    {
      goto LABEL_92;
    }
  }
  else if ((v10 & 0x100) != 0)
  {
    goto LABEL_92;
  }
  if ((*(_WORD *)&v9 & 0x200) != 0)
  {
    if ((v10 & 0x200) == 0) {
      goto LABEL_92;
    }
    if (self->_shouldEnableWebsiteAction)
    {
      if (!*((unsigned char *)v4 + 110)) {
        goto LABEL_92;
      }
    }
    else if (*((unsigned char *)v4 + 110))
    {
      goto LABEL_92;
    }
  }
  else if ((v10 & 0x200) != 0)
  {
    goto LABEL_92;
  }
  inferredCategory = self->_inferredCategory;
  if (!((unint64_t)inferredCategory | *((void *)v4 + 7))) {
    goto LABEL_87;
  }
  if (!-[NSString isEqual:](inferredCategory, "isEqual:"))
  {
LABEL_92:
    BOOL v13 = 0;
    goto LABEL_93;
  }
  $203C1FB2D65701EB3B32EE8DA255F10E v9 = self->_flags;
  int v10 = *((_DWORD *)v4 + 28);
LABEL_87:
  if ((*(unsigned char *)&v9 & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_taxonomyTypeForClientization != *((_DWORD *)v4 + 25)) {
      goto LABEL_92;
    }
    BOOL v13 = 1;
  }
  else
  {
    BOOL v13 = (v10 & 4) == 0;
  }
LABEL_93:

  return v13;
}

- (unint64_t)hash
{
  -[GEOPDAutocompletePlaceContextMetadata readAll:]((uint64_t)self, 1);
  NSUInteger v22 = [(NSString *)self->_matchedDisplayName hash];
  $203C1FB2D65701EB3B32EE8DA255F10E flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    uint64_t v21 = 2654435761 * self->_isDefaultName;
    if ((*(unsigned char *)&flags & 0x80) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v21 = 0;
    if ((*(unsigned char *)&flags & 0x80) != 0)
    {
LABEL_3:
      uint64_t v20 = 2654435761 * self->_isProminentResult;
      goto LABEL_6;
    }
  }
  uint64_t v20 = 0;
LABEL_6:
  uint64_t v19 = PBRepeatedInt32Hash();
  NSUInteger v18 = [(NSString *)self->_matchedDisplayNameLanguageCode hash];
  $203C1FB2D65701EB3B32EE8DA255F10E v4 = self->_flags;
  if ((*(_WORD *)&v4 & 0x400) != 0)
  {
    uint64_t v17 = 2654435761 * self->_shouldSuppressDirectionsAction;
    if ((*(unsigned char *)&v4 & 0x40) != 0) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v17 = 0;
    if ((*(unsigned char *)&v4 & 0x40) != 0)
    {
LABEL_8:
      uint64_t v16 = 2654435761 * self->_isLookAroundActionAllowed;
      goto LABEL_11;
    }
  }
  uint64_t v16 = 0;
LABEL_11:
  uint64_t v5 = [(NSMutableArray *)self->_alternateSearchableNames hash];
  $203C1FB2D65701EB3B32EE8DA255F10E v6 = self->_flags;
  if (*(unsigned char *)&v6)
  {
    uint64_t v7 = 2654435761 * self->_distanceDisplayThreshold;
    if ((*(unsigned char *)&v6 & 0x10) != 0)
    {
LABEL_13:
      uint64_t v8 = 2654435761 * self->_enableLookInsideActionForVenuePois;
      if ((*(unsigned char *)&v6 & 8) != 0) {
        goto LABEL_14;
      }
      goto LABEL_20;
    }
  }
  else
  {
    uint64_t v7 = 0;
    if ((*(unsigned char *)&v6 & 0x10) != 0) {
      goto LABEL_13;
    }
  }
  uint64_t v8 = 0;
  if ((*(unsigned char *)&v6 & 8) != 0)
  {
LABEL_14:
    uint64_t v9 = 2654435761 * self->_enableChildPoisWithoutAcRank;
    if ((*(unsigned char *)&v6 & 2) != 0) {
      goto LABEL_15;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v9 = 0;
  if ((*(unsigned char *)&v6 & 2) != 0)
  {
LABEL_15:
    uint64_t v10 = 2654435761 * self->_requestedShortAddressType;
    if ((*(_WORD *)&v6 & 0x100) != 0) {
      goto LABEL_16;
    }
LABEL_22:
    uint64_t v11 = 0;
    if ((*(_WORD *)&v6 & 0x200) != 0) {
      goto LABEL_17;
    }
    goto LABEL_23;
  }
LABEL_21:
  uint64_t v10 = 0;
  if ((*(_WORD *)&v6 & 0x100) == 0) {
    goto LABEL_22;
  }
LABEL_16:
  uint64_t v11 = 2654435761 * self->_shouldEnableCallAction;
  if ((*(_WORD *)&v6 & 0x200) != 0)
  {
LABEL_17:
    uint64_t v12 = 2654435761 * self->_shouldEnableWebsiteAction;
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v12 = 0;
LABEL_24:
  NSUInteger v13 = [(NSString *)self->_inferredCategory hash];
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    uint64_t v14 = 2654435761 * self->_taxonomyTypeForClientization;
  }
  else {
    uint64_t v14 = 0;
  }
  return v21 ^ v22 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
}

- (void)clearUnknownFields:(uint64_t)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_DWORD *)(a1 + 112) |= 0x800u;
    *(_DWORD *)(a1 + 112) |= 0x20000u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    $203C1FB2D65701EB3B32EE8DA255F10E v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDAutocompletePlaceContextMetadata readAll:](a1, 0);
      long long v12 = 0u;
      long long v13 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      id v5 = *(id *)(a1 + 48);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v11;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v11 != v8) {
              objc_enumerationMutation(v5);
            }
            objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "clearUnknownFields:", 1, (void)v10);
          }
          while (v7 != v9);
          uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        }
        while (v7);
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchedDisplayName, 0);
  objc_storeStrong((id *)&self->_matchedDisplayNameLanguageCode, 0);
  objc_storeStrong((id *)&self->_inferredCategory, 0);
  objc_storeStrong((id *)&self->_alternateSearchableNames, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end