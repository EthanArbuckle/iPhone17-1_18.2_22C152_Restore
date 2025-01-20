@interface GEOPDSearchTriggerFeature
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSearchTriggerFeature)init;
- (GEOPDSearchTriggerFeature)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_addNoFlagsModernToLegacyIdMapping:(uint64_t)a1;
- (void)_addNoFlagsPrefCategory:(uint64_t)a1;
- (void)_addNoFlagsRelatedCategories:(uint64_t)a1;
- (void)_readPrefCategorys;
- (void)addModernToLegacyIdMapping:(uint64_t)a1;
- (void)addPrefCategory:(os_unfair_lock_s *)a1;
- (void)addRelatedCategories:(uint64_t)a1;
- (void)dealloc;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchTriggerFeature

- (GEOPDSearchTriggerFeature)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchTriggerFeature;
  v2 = [(GEOPDSearchTriggerFeature *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchTriggerFeature)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchTriggerFeature;
  v3 = [(GEOPDSearchTriggerFeature *)&v7 initWithData:a3];
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
  v3.super_class = (Class)GEOPDSearchTriggerFeature;
  [(GEOPDSearchTriggerFeature *)&v3 dealloc];
}

- (void)_readPrefCategorys
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
  if ((*(unsigned char *)(a1 + 198) & 4) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDSearchTriggerFeatureReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPrefCategorys_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
}

- (void)addPrefCategory:(os_unfair_lock_s *)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDSearchTriggerFeature _readPrefCategorys]((uint64_t)a1);
    -[GEOPDSearchTriggerFeature _addNoFlagsPrefCategory:]((uint64_t)a1, v3);

    os_unfair_lock_lock_with_options();
    a1[49]._os_unfair_lock_opaque |= 0x40000u;
    os_unfair_lock_unlock(a1 + 44);
    a1[49]._os_unfair_lock_opaque |= 0x200000u;
  }
}

- (void)_addNoFlagsPrefCategory:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 128);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 128);
      *(void *)(a1 + 128) = v5;

      v4 = *(void **)(a1 + 128);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)addModernToLegacyIdMapping:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(unsigned char *)(a1 + 198) & 2) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchTriggerFeatureReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readModernToLegacyIdMappings_tags_2511);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
    -[GEOPDSearchTriggerFeature _addNoFlagsModernToLegacyIdMapping:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_DWORD *)(a1 + 196) |= 0x20000u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
    *(_DWORD *)(a1 + 196) |= 0x200000u;
  }
}

- (void)_addNoFlagsModernToLegacyIdMapping:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 120);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 120);
      *(void *)(a1 + 120) = v5;

      v4 = *(void **)(a1 + 120);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)addRelatedCategories:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(unsigned char *)(a1 + 198) & 8) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchTriggerFeatureReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRelatedCategories_tags_2512);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
    -[GEOPDSearchTriggerFeature _addNoFlagsRelatedCategories:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_DWORD *)(a1 + 196) |= 0x80000u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
    *(_DWORD *)(a1 + 196) |= 0x200000u;
  }
}

- (void)_addNoFlagsRelatedCategories:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 136);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 136);
      *(void *)(a1 + 136) = v5;

      v4 = *(void **)(a1 + 136);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchTriggerFeature;
  v4 = [(GEOPDSearchTriggerFeature *)&v8 description];
  id v5 = [(GEOPDSearchTriggerFeature *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchTriggerFeature _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDSearchTriggerFeature readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(unsigned char *)(a1 + 198) & 0x10) == 0)
    {
      id v5 = *(void **)(a1 + 8);
      if (v5)
      {
        id v6 = v5;
        objc_sync_enter(v6);
        GEOPDSearchTriggerFeatureReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTrigger_tags_2508);
        objc_sync_exit(v6);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
    id v7 = *(id *)(a1 + 152);
    if (v7) {
      [v4 setObject:v7 forKey:@"trigger"];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(unsigned char *)(a1 + 197) & 0x40) == 0)
    {
      objc_super v8 = *(void **)(a1 + 8);
      if (v8)
      {
        id v9 = v8;
        objc_sync_enter(v9);
        GEOPDSearchTriggerFeatureReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCanonicalName_tags);
        objc_sync_exit(v9);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
    id v10 = *(id *)(a1 + 40);
    if (v10)
    {
      if (a2) {
        v11 = @"canonicalName";
      }
      else {
        v11 = @"canonical_name";
      }
      [v4 setObject:v10 forKey:v11];
    }

    if ((*(unsigned char *)(a1 + 197) & 8) != 0)
    {
      v12 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 188)];
      [v4 setObject:v12 forKey:@"tag"];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(unsigned char *)(a1 + 198) & 1) == 0)
    {
      v13 = *(void **)(a1 + 8);
      if (v13)
      {
        id v14 = v13;
        objc_sync_enter(v14);
        GEOPDSearchTriggerFeatureReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEntityId_tags);
        objc_sync_exit(v14);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
    id v15 = *(id *)(a1 + 64);
    if (v15)
    {
      if (a2) {
        v16 = @"entityId";
      }
      else {
        v16 = @"entity_id";
      }
      [v4 setObject:v15 forKey:v16];
    }

    int v18 = *(_DWORD *)(a1 + 196);
    if ((v18 & 4) != 0)
    {
      v19 = [NSNumber numberWithLongLong:*(void *)(a1 + 80)];
      if (a2) {
        v20 = @"globalPopularity";
      }
      else {
        v20 = @"global_popularity";
      }
      [v4 setObject:v19 forKey:v20];

      int v18 = *(_DWORD *)(a1 + 196);
    }
    if ((v18 & 0x400) != 0)
    {
      LODWORD(v17) = *(_DWORD *)(a1 + 184);
      v21 = [NSNumber numberWithFloat:v17];
      if (a2) {
        v22 = @"localPmiScore";
      }
      else {
        v22 = @"local_pmi_score";
      }
      [v4 setObject:v21 forKey:v22];

      int v18 = *(_DWORD *)(a1 + 196);
    }
    if ((v18 & 0x200) != 0)
    {
      LODWORD(v17) = *(_DWORD *)(a1 + 180);
      v23 = [NSNumber numberWithFloat:v17];
      if (a2) {
        v24 = @"globalPmiScore";
      }
      else {
        v24 = @"global_pmi_Score";
      }
      [v4 setObject:v23 forKey:v24];

      int v18 = *(_DWORD *)(a1 + 196);
    }
    if ((v18 & 8) != 0)
    {
      v25 = [NSNumber numberWithDouble:*(double *)(a1 + 88)];
      [v4 setObject:v25 forKey:@"lat"];

      int v18 = *(_DWORD *)(a1 + 196);
    }
    if ((v18 & 0x10) != 0)
    {
      v26 = [NSNumber numberWithDouble:*(double *)(a1 + 96)];
      [v4 setObject:v26 forKey:@"lng"];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(unsigned char *)(a1 + 197) & 0x80) == 0)
    {
      v27 = *(void **)(a1 + 8);
      if (v27)
      {
        id v28 = v27;
        objc_sync_enter(v28);
        GEOPDSearchTriggerFeatureReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayName_tags_2509);
        objc_sync_exit(v28);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
    id v29 = *(id *)(a1 + 56);
    if (v29)
    {
      if (a2) {
        v30 = @"displayName";
      }
      else {
        v30 = @"display_name";
      }
      [v4 setObject:v29 forKey:v30];
    }

    if ((*(unsigned char *)(a1 + 196) & 0x20) != 0)
    {
      v31 = [NSNumber numberWithLongLong:*(void *)(a1 + 104)];
      [v4 setObject:v31 forKey:@"localPopularity"];
    }
    if (*(void *)(a1 + 24))
    {
      v32 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      v33 = (void *)(a1 + 16);
      if (*(void *)(a1 + 24))
      {
        unint64_t v34 = 0;
        do
        {
          uint64_t v35 = *(int *)(*v33 + 4 * v34);
          if (v35 >= 0xF)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v35);
            v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v36 = off_1E53E2AE8[v35];
          }
          [v32 addObject:v36];

          ++v34;
          v33 = (void *)(a1 + 16);
        }
        while (v34 < *(void *)(a1 + 24));
      }
      if (a2) {
        v37 = @"completionSourceTypes";
      }
      else {
        v37 = @"completion_source_types";
      }
      [v4 setObject:v32 forKey:v37];
    }
    int v38 = *(_DWORD *)(a1 + 196);
    if ((v38 & 0x1000) != 0)
    {
      v39 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 192)];
      if (a2) {
        v40 = @"isUseShowOnMapHighlightExtra";
      }
      else {
        v40 = @"is_use_show_on_map_highlight_extra";
      }
      [v4 setObject:v39 forKey:v40];

      int v38 = *(_DWORD *)(a1 + 196);
    }
    if ((v38 & 0x80) != 0)
    {
      v41 = [NSNumber numberWithDouble:*(double *)(a1 + 144)];
      if (a2) {
        v42 = @"similarityScore";
      }
      else {
        v42 = @"similarity_score";
      }
      [v4 setObject:v41 forKey:v42];

      int v38 = *(_DWORD *)(a1 + 196);
    }
    if ((v38 & 0x100) != 0)
    {
      v43 = [NSNumber numberWithDouble:*(double *)(a1 + 160)];
      if (a2) {
        v44 = @"w2vSimilarityScore";
      }
      else {
        v44 = @"w2v_similarity_score";
      }
      [v4 setObject:v43 forKey:v44];

      int v38 = *(_DWORD *)(a1 + 196);
    }
    if ((v38 & 2) != 0)
    {
      v45 = [NSNumber numberWithLongLong:*(void *)(a1 + 72)];
      if (a2) {
        v46 = @"globalEntityPopularity";
      }
      else {
        v46 = @"global_entity_popularity";
      }
      [v4 setObject:v45 forKey:v46];

      int v38 = *(_DWORD *)(a1 + 196);
    }
    if ((v38 & 0x40) != 0)
    {
      v47 = [NSNumber numberWithLongLong:*(void *)(a1 + 112)];
      if (a2) {
        v48 = @"localEntityPopularity";
      }
      else {
        v48 = @"local_entity_popularity";
      }
      [v4 setObject:v47 forKey:v48];
    }
    if (*(void *)(a1 + 128))
    {
      -[GEOPDSearchTriggerFeature _readPrefCategorys](a1);
      id v49 = *(id *)(a1 + 128);
      if (a2) {
        v50 = @"prefCategory";
      }
      else {
        v50 = @"pref_category";
      }
      [v4 setObject:v49 forKey:v50];
    }
    if ([*(id *)(a1 + 120) count])
    {
      v51 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 120), "count"));
      long long v74 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      id v52 = *(id *)(a1 + 120);
      uint64_t v53 = [v52 countByEnumeratingWithState:&v74 objects:v79 count:16];
      if (v53)
      {
        uint64_t v54 = *(void *)v75;
        do
        {
          for (uint64_t i = 0; i != v53; ++i)
          {
            if (*(void *)v75 != v54) {
              objc_enumerationMutation(v52);
            }
            v56 = *(void **)(*((void *)&v74 + 1) + 8 * i);
            if (a2) {
              [v56 jsonRepresentation];
            }
            else {
            v57 = [v56 dictionaryRepresentation];
            }
            [v51 addObject:v57];
          }
          uint64_t v53 = [v52 countByEnumeratingWithState:&v74 objects:v79 count:16];
        }
        while (v53);
      }

      if (a2) {
        v58 = @"modernToLegacyIdMapping";
      }
      else {
        v58 = @"modern_to_legacy_id_mapping";
      }
      [v4 setObject:v51 forKey:v58];
    }
    if ([*(id *)(a1 + 136) count])
    {
      v59 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 136), "count"));
      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      id v60 = *(id *)(a1 + 136);
      uint64_t v61 = [v60 countByEnumeratingWithState:&v70 objects:v78 count:16];
      if (v61)
      {
        uint64_t v62 = *(void *)v71;
        do
        {
          for (uint64_t j = 0; j != v61; ++j)
          {
            if (*(void *)v71 != v62) {
              objc_enumerationMutation(v60);
            }
            v64 = *(void **)(*((void *)&v70 + 1) + 8 * j);
            if (a2) {
              [v64 jsonRepresentation];
            }
            else {
            v65 = [v64 dictionaryRepresentation];
            }
            [v59 addObject:v65];
          }
          uint64_t v61 = [v60 countByEnumeratingWithState:&v70 objects:v78 count:16];
        }
        while (v61);
      }

      if (a2) {
        v66 = @"relatedCategories";
      }
      else {
        v66 = @"related_categories";
      }
      [v4 setObject:v59 forKey:v66];
    }
    if (*(unsigned char *)(a1 + 196))
    {
      v67 = [NSNumber numberWithLongLong:*(void *)(a1 + 48)];
      if (a2) {
        v68 = @"densityScore";
      }
      else {
        v68 = @"density_score";
      }
      [v4 setObject:v67 forKey:v68];
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
  return -[GEOPDSearchTriggerFeature _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_2579;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_2580;
      }
      GEOPDSearchTriggerFeatureReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDSearchTriggerFeatureCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchTriggerFeatureReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_DWORD *)&self->_flags & 0x3FE000) == 0)
    {
      v21 = self->_reader;
      objc_sync_enter(v21);
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      v22 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
      [v4 writeData:v22];
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v21);
      goto LABEL_64;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchTriggerFeature readAll:]((uint64_t)self, 0);
  if (self->_trigger) {
    PBDataWriterWriteStringField();
  }
  if (self->_canonicalName) {
    PBDataWriterWriteStringField();
  }
  if ((*((unsigned char *)&self->_flags + 1) & 8) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_entityId) {
    PBDataWriterWriteStringField();
  }
  $6A6745F6389B2197FDCF6C2BED3202A6 flags = self->_flags;
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    PBDataWriterWriteInt64Field();
    $6A6745F6389B2197FDCF6C2BED3202A6 flags = self->_flags;
    if ((*(_WORD *)&flags & 0x400) == 0)
    {
LABEL_13:
      if ((*(_WORD *)&flags & 0x200) == 0) {
        goto LABEL_14;
      }
      goto LABEL_55;
    }
  }
  else if ((*(_WORD *)&flags & 0x400) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteFloatField();
  $6A6745F6389B2197FDCF6C2BED3202A6 flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&flags & 8) == 0) {
      goto LABEL_15;
    }
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteFloatField();
  $6A6745F6389B2197FDCF6C2BED3202A6 flags = self->_flags;
  if ((*(unsigned char *)&flags & 8) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&flags & 0x10) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_56:
  PBDataWriterWriteDoubleField();
  if ((*(_DWORD *)&self->_flags & 0x10) != 0) {
LABEL_16:
  }
    PBDataWriterWriteDoubleField();
LABEL_17:
  if (self->_displayName) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_flags & 0x20) != 0) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_completionSourceTypes.count)
  {
    unint64_t v7 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v7;
    }
    while (v7 < self->_completionSourceTypes.count);
  }
  $6A6745F6389B2197FDCF6C2BED3202A6 v8 = self->_flags;
  if ((*(_WORD *)&v8 & 0x1000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $6A6745F6389B2197FDCF6C2BED3202A6 v8 = self->_flags;
    if ((*(unsigned char *)&v8 & 0x80) == 0)
    {
LABEL_26:
      if ((*(_WORD *)&v8 & 0x100) == 0) {
        goto LABEL_27;
      }
      goto LABEL_60;
    }
  }
  else if ((*(unsigned char *)&v8 & 0x80) == 0)
  {
    goto LABEL_26;
  }
  PBDataWriterWriteDoubleField();
  $6A6745F6389B2197FDCF6C2BED3202A6 v8 = self->_flags;
  if ((*(_WORD *)&v8 & 0x100) == 0)
  {
LABEL_27:
    if ((*(unsigned char *)&v8 & 2) == 0) {
      goto LABEL_28;
    }
LABEL_61:
    PBDataWriterWriteInt64Field();
    if ((*(_DWORD *)&self->_flags & 0x40) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_60:
  PBDataWriterWriteDoubleField();
  $6A6745F6389B2197FDCF6C2BED3202A6 v8 = self->_flags;
  if ((*(unsigned char *)&v8 & 2) != 0) {
    goto LABEL_61;
  }
LABEL_28:
  if ((*(unsigned char *)&v8 & 0x40) != 0) {
LABEL_29:
  }
    PBDataWriterWriteInt64Field();
LABEL_30:
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v9 = self->_prefCategorys;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(v9);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v10);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v13 = self->_modernToLegacyIdMappings;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v13);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v27 objects:v36 count:16];
    }
    while (v14);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  double v17 = self->_relatedCategories;
  uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v23 objects:v35 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v24;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v17);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v23 objects:v35 count:16];
    }
    while (v18);
  }

  if (*(unsigned char *)&self->_flags) {
    PBDataWriterWriteInt64Field();
  }
LABEL_64:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*((unsigned char *)&self->_flags + 2) & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDSearchTriggerFeatureReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchTriggerFeature readAll:]((uint64_t)self, 0);
  uint64_t v9 = [(NSString *)self->_trigger copyWithZone:a3];
  uint64_t v10 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v9;

  uint64_t v11 = [(NSString *)self->_canonicalName copyWithZone:a3];
  v12 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v11;

  if ((*((unsigned char *)&self->_flags + 1) & 8) != 0)
  {
    *(_DWORD *)(v5 + 188) = self->_tag;
    *(_DWORD *)(v5 + 196) |= 0x800u;
  }
  uint64_t v13 = [(NSString *)self->_entityId copyWithZone:a3];
  uint64_t v14 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v13;

  $6A6745F6389B2197FDCF6C2BED3202A6 flags = self->_flags;
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    *(void *)(v5 + 80) = self->_globalPopularity;
    *(_DWORD *)(v5 + 196) |= 4u;
    $6A6745F6389B2197FDCF6C2BED3202A6 flags = self->_flags;
    if ((*(_WORD *)&flags & 0x400) == 0)
    {
LABEL_9:
      if ((*(_WORD *)&flags & 0x200) == 0) {
        goto LABEL_10;
      }
      goto LABEL_47;
    }
  }
  else if ((*(_WORD *)&flags & 0x400) == 0)
  {
    goto LABEL_9;
  }
  *(float *)(v5 + 184) = self->_localPmiScore;
  *(_DWORD *)(v5 + 196) |= 0x400u;
  $6A6745F6389B2197FDCF6C2BED3202A6 flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&flags & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_48;
  }
LABEL_47:
  *(float *)(v5 + 180) = self->_globalPmiScore;
  *(_DWORD *)(v5 + 196) |= 0x200u;
  $6A6745F6389B2197FDCF6C2BED3202A6 flags = self->_flags;
  if ((*(unsigned char *)&flags & 8) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&flags & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_48:
  *(double *)(v5 + 88) = self->_lat;
  *(_DWORD *)(v5 + 196) |= 8u;
  if ((*(_DWORD *)&self->_flags & 0x10) != 0)
  {
LABEL_12:
    *(double *)(v5 + 96) = self->_lng;
    *(_DWORD *)(v5 + 196) |= 0x10u;
  }
LABEL_13:
  uint64_t v16 = [(NSString *)self->_displayName copyWithZone:a3];
  double v17 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v16;

  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    *(void *)(v5 + 104) = self->_localPopularity;
    *(_DWORD *)(v5 + 196) |= 0x20u;
  }
  PBRepeatedInt32Copy();
  $6A6745F6389B2197FDCF6C2BED3202A6 v18 = self->_flags;
  if ((*(_WORD *)&v18 & 0x1000) != 0)
  {
    *(unsigned char *)(v5 + 192) = self->_isUseShowOnMapHighlightExtra;
    *(_DWORD *)(v5 + 196) |= 0x1000u;
    $6A6745F6389B2197FDCF6C2BED3202A6 v18 = self->_flags;
    if ((*(unsigned char *)&v18 & 0x80) == 0)
    {
LABEL_17:
      if ((*(_WORD *)&v18 & 0x100) == 0) {
        goto LABEL_18;
      }
      goto LABEL_52;
    }
  }
  else if ((*(unsigned char *)&v18 & 0x80) == 0)
  {
    goto LABEL_17;
  }
  *(double *)(v5 + 144) = self->_similarityScore;
  *(_DWORD *)(v5 + 196) |= 0x80u;
  $6A6745F6389B2197FDCF6C2BED3202A6 v18 = self->_flags;
  if ((*(_WORD *)&v18 & 0x100) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&v18 & 2) == 0) {
      goto LABEL_19;
    }
LABEL_53:
    *(void *)(v5 + 72) = self->_globalEntityPopularity;
    *(_DWORD *)(v5 + 196) |= 2u;
    if ((*(_DWORD *)&self->_flags & 0x40) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_52:
  *(double *)(v5 + 160) = self->_w2vSimilarityScore;
  *(_DWORD *)(v5 + 196) |= 0x100u;
  $6A6745F6389B2197FDCF6C2BED3202A6 v18 = self->_flags;
  if ((*(unsigned char *)&v18 & 2) != 0) {
    goto LABEL_53;
  }
LABEL_19:
  if ((*(unsigned char *)&v18 & 0x40) != 0)
  {
LABEL_20:
    *(void *)(v5 + 112) = self->_localEntityPopularity;
    *(_DWORD *)(v5 + 196) |= 0x40u;
  }
LABEL_21:
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v19 = self->_prefCategorys;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v44 != v21) {
          objc_enumerationMutation(v19);
        }
        long long v23 = (void *)[*(id *)(*((void *)&v43 + 1) + 8 * i) copyWithZone:a3];
        -[GEOPDSearchTriggerFeature addPrefCategory:]((os_unfair_lock_s *)v5, v23);
      }
      uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v43 objects:v49 count:16];
    }
    while (v20);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v24 = self->_modernToLegacyIdMappings;
  uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v40;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v40 != v26) {
          objc_enumerationMutation(v24);
        }
        long long v28 = (void *)[*(id *)(*((void *)&v39 + 1) + 8 * j) copyWithZone:a3];
        -[GEOPDSearchTriggerFeature addModernToLegacyIdMapping:](v5, v28);
      }
      uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v39 objects:v48 count:16];
    }
    while (v25);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v29 = self->_relatedCategories;
  uint64_t v30 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v35 objects:v47 count:16];
  if (v30)
  {
    uint64_t v31 = *(void *)v36;
    do
    {
      for (uint64_t k = 0; k != v30; ++k)
      {
        if (*(void *)v36 != v31) {
          objc_enumerationMutation(v29);
        }
        long long v33 = objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * k), "copyWithZone:", a3, (void)v35);
        -[GEOPDSearchTriggerFeature addRelatedCategories:](v5, v33);
      }
      uint64_t v30 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v35 objects:v47 count:16];
    }
    while (v30);
  }

  if (*(unsigned char *)&self->_flags)
  {
    *(void *)(v5 + 48) = self->_densityScore;
    *(_DWORD *)(v5 + 196) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_87;
  }
  -[GEOPDSearchTriggerFeature readAll:]((uint64_t)self, 1);
  -[GEOPDSearchTriggerFeature readAll:]((uint64_t)v4, 1);
  trigger = self->_trigger;
  if ((unint64_t)trigger | *((void *)v4 + 19))
  {
    if (!-[NSString isEqual:](trigger, "isEqual:")) {
      goto LABEL_87;
    }
  }
  canonicalName = self->_canonicalName;
  if ((unint64_t)canonicalName | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](canonicalName, "isEqual:")) {
      goto LABEL_87;
    }
  }
  $6A6745F6389B2197FDCF6C2BED3202A6 flags = self->_flags;
  int v8 = *((_DWORD *)v4 + 49);
  if ((*(_WORD *)&flags & 0x800) != 0)
  {
    if ((v8 & 0x800) == 0 || self->_tag != *((_DWORD *)v4 + 47)) {
      goto LABEL_87;
    }
  }
  else if ((v8 & 0x800) != 0)
  {
    goto LABEL_87;
  }
  entityId = self->_entityId;
  if ((unint64_t)entityId | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](entityId, "isEqual:")) {
      goto LABEL_87;
    }
    $6A6745F6389B2197FDCF6C2BED3202A6 flags = self->_flags;
    int v8 = *((_DWORD *)v4 + 49);
  }
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_globalPopularity != *((void *)v4 + 10)) {
      goto LABEL_87;
    }
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    if ((v8 & 0x400) == 0 || self->_localPmiScore != *((float *)v4 + 46)) {
      goto LABEL_87;
    }
  }
  else if ((v8 & 0x400) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    if ((v8 & 0x200) == 0 || self->_globalPmiScore != *((float *)v4 + 45)) {
      goto LABEL_87;
    }
  }
  else if ((v8 & 0x200) != 0)
  {
    goto LABEL_87;
  }
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_lat != *((double *)v4 + 11)) {
      goto LABEL_87;
    }
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_87;
  }
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_lng != *((double *)v4 + 12)) {
      goto LABEL_87;
    }
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_87;
  }
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:")) {
      goto LABEL_87;
    }
    $6A6745F6389B2197FDCF6C2BED3202A6 flags = self->_flags;
    int v8 = *((_DWORD *)v4 + 49);
  }
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0 || self->_localPopularity != *((void *)v4 + 13)) {
      goto LABEL_87;
    }
  }
  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_87;
  }
  if (!PBRepeatedInt32IsEqual())
  {
LABEL_87:
    BOOL v16 = 0;
    goto LABEL_88;
  }
  $6A6745F6389B2197FDCF6C2BED3202A6 v11 = self->_flags;
  int v12 = *((_DWORD *)v4 + 49);
  if ((*(_WORD *)&v11 & 0x1000) != 0)
  {
    if ((v12 & 0x1000) != 0)
    {
      if (self->_isUseShowOnMapHighlightExtra)
      {
        if (!*((unsigned char *)v4 + 192)) {
          goto LABEL_87;
        }
        goto LABEL_56;
      }
      if (!*((unsigned char *)v4 + 192)) {
        goto LABEL_56;
      }
    }
    goto LABEL_87;
  }
  if ((v12 & 0x1000) != 0) {
    goto LABEL_87;
  }
LABEL_56:
  if ((*(unsigned char *)&v11 & 0x80) != 0)
  {
    if ((v12 & 0x80) == 0 || self->_similarityScore != *((double *)v4 + 18)) {
      goto LABEL_87;
    }
  }
  else if ((v12 & 0x80) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_WORD *)&v11 & 0x100) != 0)
  {
    if ((v12 & 0x100) == 0 || self->_w2vSimilarityScore != *((double *)v4 + 20)) {
      goto LABEL_87;
    }
  }
  else if ((v12 & 0x100) != 0)
  {
    goto LABEL_87;
  }
  if ((*(unsigned char *)&v11 & 2) != 0)
  {
    if ((v12 & 2) == 0 || self->_globalEntityPopularity != *((void *)v4 + 9)) {
      goto LABEL_87;
    }
  }
  else if ((v12 & 2) != 0)
  {
    goto LABEL_87;
  }
  if ((*(unsigned char *)&v11 & 0x40) != 0)
  {
    if ((v12 & 0x40) == 0 || self->_localEntityPopularity != *((void *)v4 + 14)) {
      goto LABEL_87;
    }
  }
  else if ((v12 & 0x40) != 0)
  {
    goto LABEL_87;
  }
  prefCategorys = self->_prefCategorys;
  if ((unint64_t)prefCategorys | *((void *)v4 + 16)
    && !-[NSMutableArray isEqual:](prefCategorys, "isEqual:"))
  {
    goto LABEL_87;
  }
  modernToLegacyIdMappings = self->_modernToLegacyIdMappings;
  if ((unint64_t)modernToLegacyIdMappings | *((void *)v4 + 15))
  {
    if (!-[NSMutableArray isEqual:](modernToLegacyIdMappings, "isEqual:")) {
      goto LABEL_87;
    }
  }
  relatedCategories = self->_relatedCategories;
  if ((unint64_t)relatedCategories | *((void *)v4 + 17))
  {
    if (!-[NSMutableArray isEqual:](relatedCategories, "isEqual:")) {
      goto LABEL_87;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((_DWORD *)v4 + 49) & 1) == 0 || self->_densityScore != *((void *)v4 + 6)) {
      goto LABEL_87;
    }
    BOOL v16 = 1;
  }
  else
  {
    BOOL v16 = (*((_DWORD *)v4 + 49) & 1) == 0;
  }
LABEL_88:

  return v16;
}

- (unint64_t)hash
{
  -[GEOPDSearchTriggerFeature readAll:]((uint64_t)self, 1);
  NSUInteger v54 = [(NSString *)self->_trigger hash];
  NSUInteger v53 = [(NSString *)self->_canonicalName hash];
  if ((*((unsigned char *)&self->_flags + 1) & 8) != 0) {
    uint64_t v52 = 2654435761 * self->_tag;
  }
  else {
    uint64_t v52 = 0;
  }
  NSUInteger v51 = [(NSString *)self->_entityId hash];
  $6A6745F6389B2197FDCF6C2BED3202A6 flags = self->_flags;
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    uint64_t v50 = 2654435761 * self->_globalPopularity;
    if ((*(_WORD *)&flags & 0x400) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    unint64_t v8 = 0;
    goto LABEL_14;
  }
  uint64_t v50 = 0;
  if ((*(_WORD *)&flags & 0x400) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  float localPmiScore = self->_localPmiScore;
  double v5 = localPmiScore;
  if (localPmiScore < 0.0) {
    double v5 = -localPmiScore;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0) {
      v8 += (unint64_t)v7;
    }
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
LABEL_14:
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    float globalPmiScore = self->_globalPmiScore;
    double v11 = globalPmiScore;
    if (globalPmiScore < 0.0) {
      double v11 = -globalPmiScore;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    double lat = self->_lat;
    double v16 = -lat;
    if (lat >= 0.0) {
      double v16 = self->_lat;
    }
    long double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  unint64_t v48 = v14;
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    double lng = self->_lng;
    double v21 = -lng;
    if (lng >= 0.0) {
      double v21 = self->_lng;
    }
    long double v22 = floor(v21 + 0.5);
    double v23 = (v21 - v22) * 1.84467441e19;
    unint64_t v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0) {
        v19 += (unint64_t)v23;
      }
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    unint64_t v19 = 0;
  }
  unint64_t v47 = v19;
  NSUInteger v46 = [(NSString *)self->_displayName hash];
  if ((*(unsigned char *)&self->_flags & 0x20) != 0) {
    uint64_t v45 = 2654435761 * self->_localPopularity;
  }
  else {
    uint64_t v45 = 0;
  }
  uint64_t v44 = PBRepeatedInt32Hash();
  $6A6745F6389B2197FDCF6C2BED3202A6 v24 = self->_flags;
  if ((*(_WORD *)&v24 & 0x1000) != 0) {
    uint64_t v43 = 2654435761 * self->_isUseShowOnMapHighlightExtra;
  }
  else {
    uint64_t v43 = 0;
  }
  unint64_t v49 = v9;
  if ((*(unsigned char *)&v24 & 0x80) != 0)
  {
    double similarityScore = self->_similarityScore;
    double v27 = -similarityScore;
    if (similarityScore >= 0.0) {
      double v27 = self->_similarityScore;
    }
    long double v28 = floor(v27 + 0.5);
    double v29 = (v27 - v28) * 1.84467441e19;
    unint64_t v25 = 2654435761u * (unint64_t)fmod(v28, 1.84467441e19);
    if (v29 >= 0.0)
    {
      if (v29 > 0.0) {
        v25 += (unint64_t)v29;
      }
    }
    else
    {
      v25 -= (unint64_t)fabs(v29);
    }
  }
  else
  {
    unint64_t v25 = 0;
  }
  unint64_t v30 = v8;
  if ((*(_WORD *)&v24 & 0x100) != 0)
  {
    double w2vSimilarityScore = self->_w2vSimilarityScore;
    double v33 = -w2vSimilarityScore;
    if (w2vSimilarityScore >= 0.0) {
      double v33 = self->_w2vSimilarityScore;
    }
    long double v34 = floor(v33 + 0.5);
    double v35 = (v33 - v34) * 1.84467441e19;
    unint64_t v31 = 2654435761u * (unint64_t)fmod(v34, 1.84467441e19);
    if (v35 >= 0.0)
    {
      if (v35 > 0.0) {
        v31 += (unint64_t)v35;
      }
    }
    else
    {
      v31 -= (unint64_t)fabs(v35);
    }
  }
  else
  {
    unint64_t v31 = 0;
  }
  if ((*(unsigned char *)&v24 & 2) != 0)
  {
    uint64_t v36 = 2654435761 * self->_globalEntityPopularity;
    if ((*(unsigned char *)&v24 & 0x40) != 0) {
      goto LABEL_62;
    }
  }
  else
  {
    uint64_t v36 = 0;
    if ((*(unsigned char *)&v24 & 0x40) != 0)
    {
LABEL_62:
      uint64_t v37 = 2654435761 * self->_localEntityPopularity;
      goto LABEL_65;
    }
  }
  uint64_t v37 = 0;
LABEL_65:
  uint64_t v38 = [(NSMutableArray *)self->_prefCategorys hash];
  uint64_t v39 = [(NSMutableArray *)self->_modernToLegacyIdMappings hash];
  uint64_t v40 = [(NSMutableArray *)self->_relatedCategories hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v41 = 2654435761 * self->_densityScore;
  }
  else {
    uint64_t v41 = 0;
  }
  return v53 ^ v54 ^ v52 ^ v51 ^ v50 ^ v30 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v25 ^ v31 ^ v36 ^ v37 ^ v38 ^ v39 ^ v40 ^ v41;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trigger, 0);
  objc_storeStrong((id *)&self->_relatedCategories, 0);
  objc_storeStrong((id *)&self->_prefCategorys, 0);
  objc_storeStrong((id *)&self->_modernToLegacyIdMappings, 0);
  objc_storeStrong((id *)&self->_entityId, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_canonicalName, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end