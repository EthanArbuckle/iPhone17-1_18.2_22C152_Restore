@interface GEOPDSearchChainIntent
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSearchChainIntent)init;
- (GEOPDSearchChainIntent)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_addNoFlagsBrandRelationshipInfo:(uint64_t)a1;
- (void)_addNoFlagsCategoryId:(uint64_t)a1;
- (void)_addNoFlagsFeatureMap:(uint64_t)a1;
- (void)_addNoFlagsPrefCategoryId:(uint64_t)a1;
- (void)_addNoFlagsRelatedBrand:(uint64_t)a1;
- (void)_readCategoryIds;
- (void)_readPrefCategoryIds;
- (void)addBrandRelationshipInfo:(uint64_t)a1;
- (void)addCategoryId:(uint64_t)a1;
- (void)addFeatureMap:(uint64_t)a1;
- (void)addPrefCategoryId:(uint64_t)a1;
- (void)addRelatedBrand:(uint64_t)a1;
- (void)dealloc;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchChainIntent

- (GEOPDSearchChainIntent)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchChainIntent;
  v2 = [(GEOPDSearchChainIntent *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchChainIntent)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchChainIntent;
  v3 = [(GEOPDSearchChainIntent *)&v7 initWithData:a3];
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
  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDSearchChainIntent;
  [(GEOPDSearchChainIntent *)&v3 dealloc];
}

- (void)_readCategoryIds
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
  if ((*(_WORD *)(a1 + 136) & 0x40) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDSearchChainIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCategoryIds_tags_535);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
}

- (void)addCategoryId:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDSearchChainIntent _readCategoryIds](a1);
    -[GEOPDSearchChainIntent _addNoFlagsCategoryId:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 136) |= 0x40u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
    *(_WORD *)(a1 + 136) |= 0x4000u;
  }
}

- (void)_addNoFlagsCategoryId:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 56);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v5;

      v4 = *(void **)(a1 + 56);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)addFeatureMap:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 136) & 0x100) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchChainIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFeatureMaps_tags_536);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
    -[GEOPDSearchChainIntent _addNoFlagsFeatureMap:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 136) |= 0x100u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
    *(_WORD *)(a1 + 136) |= 0x4000u;
  }
}

- (void)_addNoFlagsFeatureMap:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 72);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 72);
      *(void *)(a1 + 72) = v5;

      v4 = *(void **)(a1 + 72);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)addRelatedBrand:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 136) & 0x800) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchChainIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRelatedBrands_tags);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
    -[GEOPDSearchChainIntent _addNoFlagsRelatedBrand:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 136) |= 0x800u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
    *(_WORD *)(a1 + 136) |= 0x4000u;
  }
}

- (void)_addNoFlagsRelatedBrand:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 96);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 96);
      *(void *)(a1 + 96) = v5;

      v4 = *(void **)(a1 + 96);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)addBrandRelationshipInfo:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 136) & 0x20) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchChainIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBrandRelationshipInfos_tags);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
    -[GEOPDSearchChainIntent _addNoFlagsBrandRelationshipInfo:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 136) |= 0x20u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
    *(_WORD *)(a1 + 136) |= 0x4000u;
  }
}

- (void)_addNoFlagsBrandRelationshipInfo:(uint64_t)a1
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

- (void)_readPrefCategoryIds
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
  if ((*(_WORD *)(a1 + 136) & 0x400) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDSearchChainIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPrefCategoryIds_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
}

- (void)addPrefCategoryId:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDSearchChainIntent _readPrefCategoryIds](a1);
    -[GEOPDSearchChainIntent _addNoFlagsPrefCategoryId:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 136) |= 0x400u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
    *(_WORD *)(a1 + 136) |= 0x4000u;
  }
}

- (void)_addNoFlagsPrefCategoryId:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 88);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 88);
      *(void *)(a1 + 88) = v5;

      v4 = *(void **)(a1 + 88);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchChainIntent;
  v4 = [(GEOPDSearchChainIntent *)&v8 description];
  id v5 = [(GEOPDSearchChainIntent *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchChainIntent _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDSearchChainIntent readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 136) & 0x2000) == 0)
    {
      id v5 = *(void **)(a1 + 8);
      if (v5)
      {
        id v6 = v5;
        objc_sync_enter(v6);
        GEOPDSearchChainIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTrigger_tags_533);
        objc_sync_exit(v6);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
    id v7 = *(id *)(a1 + 112);
    if (v7) {
      [v4 setObject:v7 forKey:@"trigger"];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 136) & 0x80) == 0)
    {
      objc_super v8 = *(void **)(a1 + 8);
      if (v8)
      {
        id v9 = v8;
        objc_sync_enter(v9);
        GEOPDSearchChainIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readChainId_tags_0);
        objc_sync_exit(v9);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
    id v10 = *(id *)(a1 + 64);
    if (v10)
    {
      if (a2) {
        v11 = @"chainId";
      }
      else {
        v11 = @"chain_id";
      }
      [v4 setObject:v10 forKey:v11];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 136) & 0x200) == 0)
    {
      v12 = *(void **)(a1 + 8);
      if (v12)
      {
        id v13 = v12;
        objc_sync_enter(v13);
        GEOPDSearchChainIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readGeminiBrand_tags);
        objc_sync_exit(v13);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
    id v14 = *(id *)(a1 + 80);
    if (v14)
    {
      if (a2) {
        v15 = @"geminiBrand";
      }
      else {
        v15 = @"gemini_brand";
      }
      [v4 setObject:v14 forKey:v15];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 136) & 0x1000) == 0)
    {
      v16 = *(void **)(a1 + 8);
      if (v16)
      {
        id v17 = v16;
        objc_sync_enter(v17);
        GEOPDSearchChainIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTokenSet_tags_534);
        objc_sync_exit(v17);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
    id v18 = *(id *)(a1 + 104);
    v19 = v18;
    if (v18)
    {
      if (a2)
      {
        v20 = [v18 jsonRepresentation];
        v21 = @"tokenSet";
      }
      else
      {
        v20 = [v18 dictionaryRepresentation];
        v21 = @"token_set";
      }
      [v4 setObject:v20 forKey:v21];
    }
    __int16 v22 = *(_WORD *)(a1 + 136);
    if ((v22 & 4) != 0)
    {
      v23 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 133)];
      [v4 setObject:v23 forKey:@"isLocalChain"];

      __int16 v22 = *(_WORD *)(a1 + 136);
    }
    if ((v22 & 2) != 0)
    {
      v24 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 132)];
      [v4 setObject:v24 forKey:@"isChainInSameCountry"];

      __int16 v22 = *(_WORD *)(a1 + 136);
    }
    if (v22)
    {
      v25 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
      if (a2) {
        v26 = @"brandMuid";
      }
      else {
        v26 = @"brand_muid";
      }
      [v4 setObject:v25 forKey:v26];

      __int16 v22 = *(_WORD *)(a1 + 136);
    }
    if ((v22 & 8) != 0)
    {
      v27 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 134)];
      if (a2) {
        v28 = @"isFromBrandProfile";
      }
      else {
        v28 = @"is_from_brand_profile";
      }
      [v4 setObject:v27 forKey:v28];
    }
    if (*(void *)(a1 + 56))
    {
      -[GEOPDSearchChainIntent _readCategoryIds](a1);
      id v29 = *(id *)(a1 + 56);
      if (a2) {
        v30 = @"categoryId";
      }
      else {
        v30 = @"category_id";
      }
      [v4 setObject:v29 forKey:v30];
    }
    if ([*(id *)(a1 + 72) count])
    {
      v31 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 72), "count"));
      long long v68 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      id v32 = *(id *)(a1 + 72);
      uint64_t v33 = [v32 countByEnumeratingWithState:&v68 objects:v74 count:16];
      if (v33)
      {
        uint64_t v34 = *(void *)v69;
        do
        {
          for (uint64_t i = 0; i != v33; ++i)
          {
            if (*(void *)v69 != v34) {
              objc_enumerationMutation(v32);
            }
            v36 = *(void **)(*((void *)&v68 + 1) + 8 * i);
            if (a2) {
              [v36 jsonRepresentation];
            }
            else {
            v37 = [v36 dictionaryRepresentation];
            }
            [v31 addObject:v37];
          }
          uint64_t v33 = [v32 countByEnumeratingWithState:&v68 objects:v74 count:16];
        }
        while (v33);
      }

      if (a2) {
        v38 = @"featureMap";
      }
      else {
        v38 = @"feature_map";
      }
      [v4 setObject:v31 forKey:v38];
    }
    if (*(void *)(a1 + 24))
    {
      v39 = PBRepeatedUInt64NSArray();
      if (a2) {
        v40 = @"brandMuids";
      }
      else {
        v40 = @"brand_muids";
      }
      [v4 setObject:v39 forKey:v40];
    }
    if ([*(id *)(a1 + 96) count])
    {
      v41 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 96), "count"));
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      id v42 = *(id *)(a1 + 96);
      uint64_t v43 = [v42 countByEnumeratingWithState:&v64 objects:v73 count:16];
      if (v43)
      {
        uint64_t v44 = *(void *)v65;
        do
        {
          for (uint64_t j = 0; j != v43; ++j)
          {
            if (*(void *)v65 != v44) {
              objc_enumerationMutation(v42);
            }
            v46 = *(void **)(*((void *)&v64 + 1) + 8 * j);
            if (a2) {
              [v46 jsonRepresentation];
            }
            else {
            v47 = [v46 dictionaryRepresentation];
            }
            [v41 addObject:v47];
          }
          uint64_t v43 = [v42 countByEnumeratingWithState:&v64 objects:v73 count:16];
        }
        while (v43);
      }

      if (a2) {
        v48 = @"relatedBrand";
      }
      else {
        v48 = @"related_brand";
      }
      [v4 setObject:v41 forKey:v48];
    }
    if ([*(id *)(a1 + 48) count])
    {
      v49 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      id v50 = *(id *)(a1 + 48);
      uint64_t v51 = [v50 countByEnumeratingWithState:&v60 objects:v72 count:16];
      if (v51)
      {
        uint64_t v52 = *(void *)v61;
        do
        {
          for (uint64_t k = 0; k != v51; ++k)
          {
            if (*(void *)v61 != v52) {
              objc_enumerationMutation(v50);
            }
            v54 = *(void **)(*((void *)&v60 + 1) + 8 * k);
            if (a2) {
              [v54 jsonRepresentation];
            }
            else {
            v55 = objc_msgSend(v54, "dictionaryRepresentation", (void)v60);
            }
            objc_msgSend(v49, "addObject:", v55, (void)v60);
          }
          uint64_t v51 = [v50 countByEnumeratingWithState:&v60 objects:v72 count:16];
        }
        while (v51);
      }

      if (a2) {
        v56 = @"brandRelationshipInfo";
      }
      else {
        v56 = @"brand_relationship_info";
      }
      objc_msgSend(v4, "setObject:forKey:", v49, v56, (void)v60);
    }
    if (*(void *)(a1 + 88))
    {
      -[GEOPDSearchChainIntent _readPrefCategoryIds](a1);
      id v57 = *(id *)(a1 + 88);
      if (a2) {
        v58 = @"prefCategoryId";
      }
      else {
        v58 = @"pref_category_id";
      }
      [v4 setObject:v57 forKey:v58];
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
  return -[GEOPDSearchChainIntent _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_593;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_594;
      }
      GEOPDSearchChainIntentReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDSearchChainIntentCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchChainIntentReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDSearchChainIntentIsDirty((uint64_t)self) & 1) == 0)
  {
    v28 = self->_reader;
    objc_sync_enter(v28);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v29 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v29];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v28);
    goto LABEL_60;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchChainIntent readAll:]((uint64_t)self, 0);
  if (self->_trigger) {
    PBDataWriterWriteStringField();
  }
  if (self->_chainId) {
    PBDataWriterWriteStringField();
  }
  if (self->_geminiBrand) {
    PBDataWriterWriteStringField();
  }
  if (self->_tokenSet) {
    PBDataWriterWriteSubmessage();
  }
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 flags = (__int16)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_13:
      if ((flags & 1) == 0) {
        goto LABEL_14;
      }
LABEL_57:
      PBDataWriterWriteUint64Field();
      if ((*(_WORD *)&self->_flags & 8) == 0) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }
  }
  else if ((flags & 2) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteBOOLField();
  __int16 flags = (__int16)self->_flags;
  if (flags) {
    goto LABEL_57;
  }
LABEL_14:
  if ((flags & 8) != 0) {
LABEL_15:
  }
    PBDataWriterWriteBOOLField();
LABEL_16:
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v7 = self->_categoryIds;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v47 != v9) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v46 objects:v54 count:16];
    }
    while (v8);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v11 = self->_featureMaps;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v42 objects:v53 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v43;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v43 != v13) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v42 objects:v53 count:16];
    }
    while (v12);
  }

  if (self->_brandMuids.count)
  {
    unint64_t v15 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      ++v15;
    }
    while (v15 < self->_brandMuids.count);
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v16 = self->_relatedBrands;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v38 objects:v52 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v39;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v39 != v18) {
          objc_enumerationMutation(v16);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v38 objects:v52 count:16];
    }
    while (v17);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v20 = self->_brandRelationshipInfos;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v34 objects:v51 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v35;
    do
    {
      for (uint64_t m = 0; m != v21; ++m)
      {
        if (*(void *)v35 != v22) {
          objc_enumerationMutation(v20);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v34 objects:v51 count:16];
    }
    while (v21);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v24 = self->_prefCategoryIds;
  uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v30 objects:v50 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v31;
    do
    {
      for (uint64_t n = 0; n != v25; ++n)
      {
        if (*(void *)v31 != v26) {
          objc_enumerationMutation(v24);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v30 objects:v50 count:16];
    }
    while (v25);
  }

LABEL_60:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x4000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDSearchChainIntentReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      uint64_t v8 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v7);

      goto LABEL_45;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchChainIntent readAll:]((uint64_t)self, 0);
  uint64_t v9 = [(NSString *)self->_trigger copyWithZone:a3];
  id v10 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v9;

  uint64_t v11 = [(NSString *)self->_chainId copyWithZone:a3];
  uint64_t v12 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v11;

  uint64_t v13 = [(NSString *)self->_geminiBrand copyWithZone:a3];
  id v14 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v13;

  id v15 = [(GEOPDSearchTokenSet *)self->_tokenSet copyWithZone:a3];
  v16 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v15;

  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    *(unsigned char *)(v5 + 133) = self->_isLocalChain;
    *(_WORD *)(v5 + 136) |= 4u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_7:
      if ((flags & 1) == 0) {
        goto LABEL_8;
      }
LABEL_48:
      *(void *)(v5 + 40) = self->_brandMuid;
      *(_WORD *)(v5 + 136) |= 1u;
      if ((*(_WORD *)&self->_flags & 8) == 0) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  else if ((flags & 2) == 0)
  {
    goto LABEL_7;
  }
  *(unsigned char *)(v5 + 132) = self->_isChainInSameCountry;
  *(_WORD *)(v5 + 136) |= 2u;
  __int16 flags = (__int16)self->_flags;
  if (flags) {
    goto LABEL_48;
  }
LABEL_8:
  if ((flags & 8) != 0)
  {
LABEL_9:
    *(unsigned char *)(v5 + 134) = self->_isFromBrandProfile;
    *(_WORD *)(v5 + 136) |= 8u;
  }
LABEL_10:
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  uint64_t v18 = self->_categoryIds;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v59 objects:v67 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v60 != v20) {
          objc_enumerationMutation(v18);
        }
        uint64_t v22 = (void *)[*(id *)(*((void *)&v59 + 1) + 8 * i) copyWithZone:a3];
        -[GEOPDSearchChainIntent addCategoryId:](v5, v22);
      }
      uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v59 objects:v67 count:16];
    }
    while (v19);
  }

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  v23 = self->_featureMaps;
  uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v55 objects:v66 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v56;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v56 != v25) {
          objc_enumerationMutation(v23);
        }
        v27 = (void *)[*(id *)(*((void *)&v55 + 1) + 8 * j) copyWithZone:a3];
        -[GEOPDSearchChainIntent addFeatureMap:](v5, v27);
      }
      uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v55 objects:v66 count:16];
    }
    while (v24);
  }

  PBRepeatedUInt64Copy();
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  v28 = self->_relatedBrands;
  uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v51 objects:v65 count:16];
  if (v29)
  {
    uint64_t v30 = *(void *)v52;
    do
    {
      for (uint64_t k = 0; k != v29; ++k)
      {
        if (*(void *)v52 != v30) {
          objc_enumerationMutation(v28);
        }
        long long v32 = (void *)[*(id *)(*((void *)&v51 + 1) + 8 * k) copyWithZone:a3];
        -[GEOPDSearchChainIntent addRelatedBrand:](v5, v32);
      }
      uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v51 objects:v65 count:16];
    }
    while (v29);
  }

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v33 = self->_brandRelationshipInfos;
  uint64_t v34 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v47 objects:v64 count:16];
  if (v34)
  {
    uint64_t v35 = *(void *)v48;
    do
    {
      for (uint64_t m = 0; m != v34; ++m)
      {
        if (*(void *)v48 != v35) {
          objc_enumerationMutation(v33);
        }
        long long v37 = (void *)[*(id *)(*((void *)&v47 + 1) + 8 * m) copyWithZone:a3];
        -[GEOPDSearchChainIntent addBrandRelationshipInfo:](v5, v37);
      }
      uint64_t v34 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v47 objects:v64 count:16];
    }
    while (v34);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v8 = self->_prefCategoryIds;
  uint64_t v38 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v43 objects:v63 count:16];
  if (v38)
  {
    uint64_t v39 = *(void *)v44;
    do
    {
      for (uint64_t n = 0; n != v38; ++n)
      {
        if (*(void *)v44 != v39) {
          objc_enumerationMutation(v8);
        }
        long long v41 = objc_msgSend(*(id *)(*((void *)&v43 + 1) + 8 * n), "copyWithZone:", a3, (void)v43);
        -[GEOPDSearchChainIntent addPrefCategoryId:](v5, v41);
      }
      uint64_t v38 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v43 objects:v63 count:16];
    }
    while (v38);
  }
LABEL_45:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_50;
  }
  -[GEOPDSearchChainIntent readAll:]((uint64_t)self, 1);
  -[GEOPDSearchChainIntent readAll:]((uint64_t)v4, 1);
  trigger = self->_trigger;
  if ((unint64_t)trigger | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](trigger, "isEqual:")) {
      goto LABEL_50;
    }
  }
  chainId = self->_chainId;
  if ((unint64_t)chainId | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](chainId, "isEqual:")) {
      goto LABEL_50;
    }
  }
  geminiBrand = self->_geminiBrand;
  if ((unint64_t)geminiBrand | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](geminiBrand, "isEqual:")) {
      goto LABEL_50;
    }
  }
  tokenSet = self->_tokenSet;
  if ((unint64_t)tokenSet | *((void *)v4 + 13))
  {
    if (!-[GEOPDSearchTokenSet isEqual:](tokenSet, "isEqual:")) {
      goto LABEL_50;
    }
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v10 = *((_WORD *)v4 + 68);
  if ((flags & 4) != 0)
  {
    if ((v10 & 4) == 0) {
      goto LABEL_50;
    }
    if (self->_isLocalChain)
    {
      if (!*((unsigned char *)v4 + 133)) {
        goto LABEL_50;
      }
    }
    else if (*((unsigned char *)v4 + 133))
    {
      goto LABEL_50;
    }
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_50;
  }
  if ((flags & 2) != 0)
  {
    if ((v10 & 2) == 0) {
      goto LABEL_50;
    }
    if (self->_isChainInSameCountry)
    {
      if (!*((unsigned char *)v4 + 132)) {
        goto LABEL_50;
      }
    }
    else if (*((unsigned char *)v4 + 132))
    {
      goto LABEL_50;
    }
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_50;
  }
  if (flags)
  {
    if ((v10 & 1) == 0 || self->_brandMuid != *((void *)v4 + 5)) {
      goto LABEL_50;
    }
  }
  else if (v10)
  {
    goto LABEL_50;
  }
  if ((flags & 8) != 0)
  {
    if ((v10 & 8) != 0)
    {
      if (self->_isFromBrandProfile)
      {
        if (!*((unsigned char *)v4 + 134)) {
          goto LABEL_50;
        }
        goto LABEL_39;
      }
      if (!*((unsigned char *)v4 + 134)) {
        goto LABEL_39;
      }
    }
LABEL_50:
    char v16 = 0;
    goto LABEL_51;
  }
  if ((v10 & 8) != 0) {
    goto LABEL_50;
  }
LABEL_39:
  categoryIds = self->_categoryIds;
  if ((unint64_t)categoryIds | *((void *)v4 + 7)
    && !-[NSMutableArray isEqual:](categoryIds, "isEqual:"))
  {
    goto LABEL_50;
  }
  featureMaps = self->_featureMaps;
  if ((unint64_t)featureMaps | *((void *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](featureMaps, "isEqual:")) {
      goto LABEL_50;
    }
  }
  if (!PBRepeatedUInt64IsEqual()) {
    goto LABEL_50;
  }
  relatedBrands = self->_relatedBrands;
  if ((unint64_t)relatedBrands | *((void *)v4 + 12))
  {
    if (!-[NSMutableArray isEqual:](relatedBrands, "isEqual:")) {
      goto LABEL_50;
    }
  }
  brandRelationshipInfos = self->_brandRelationshipInfos;
  if ((unint64_t)brandRelationshipInfos | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](brandRelationshipInfos, "isEqual:")) {
      goto LABEL_50;
    }
  }
  prefCategoryIds = self->_prefCategoryIds;
  if ((unint64_t)prefCategoryIds | *((void *)v4 + 11)) {
    char v16 = -[NSMutableArray isEqual:](prefCategoryIds, "isEqual:");
  }
  else {
    char v16 = 1;
  }
LABEL_51:

  return v16;
}

- (unint64_t)hash
{
  -[GEOPDSearchChainIntent readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_trigger hash];
  NSUInteger v4 = [(NSString *)self->_chainId hash];
  NSUInteger v5 = [(NSString *)self->_geminiBrand hash];
  unint64_t v6 = [(GEOPDSearchTokenSet *)self->_tokenSet hash];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    uint64_t v8 = 2654435761 * self->_isLocalChain;
    if ((flags & 2) != 0)
    {
LABEL_3:
      uint64_t v9 = 2654435761 * self->_isChainInSameCountry;
      if (flags) {
        goto LABEL_4;
      }
LABEL_8:
      unint64_t v10 = 0;
      if ((flags & 8) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v11 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v8 = 0;
    if ((flags & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v9 = 0;
  if ((flags & 1) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  unint64_t v10 = 2654435761u * self->_brandMuid;
  if ((flags & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v11 = 2654435761 * self->_isFromBrandProfile;
LABEL_10:
  NSUInteger v12 = v4 ^ v3 ^ v5 ^ v6;
  uint64_t v13 = v8 ^ v9 ^ v10 ^ v11 ^ [(NSMutableArray *)self->_categoryIds hash];
  uint64_t v14 = v12 ^ v13 ^ [(NSMutableArray *)self->_featureMaps hash];
  uint64_t v15 = PBRepeatedUInt64Hash();
  uint64_t v16 = v15 ^ [(NSMutableArray *)self->_relatedBrands hash];
  uint64_t v17 = v16 ^ [(NSMutableArray *)self->_brandRelationshipInfos hash];
  return v14 ^ v17 ^ [(NSMutableArray *)self->_prefCategoryIds hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trigger, 0);
  objc_storeStrong((id *)&self->_tokenSet, 0);
  objc_storeStrong((id *)&self->_relatedBrands, 0);
  objc_storeStrong((id *)&self->_prefCategoryIds, 0);
  objc_storeStrong((id *)&self->_geminiBrand, 0);
  objc_storeStrong((id *)&self->_featureMaps, 0);
  objc_storeStrong((id *)&self->_chainId, 0);
  objc_storeStrong((id *)&self->_categoryIds, 0);
  objc_storeStrong((id *)&self->_brandRelationshipInfos, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end