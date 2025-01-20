@interface GEOPDSearchCategoryIntent
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSearchCategoryIntent)init;
- (GEOPDSearchCategoryIntent)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_addNoFlagsCanonicalName:(uint64_t)a1;
- (void)_addNoFlagsCategoryId:(uint64_t)a1;
- (void)_addNoFlagsCategoryMappings:(uint64_t)a1;
- (void)_addNoFlagsExpandedCategoryId:(uint64_t)a1;
- (void)_addNoFlagsFeatureMap:(uint64_t)a1;
- (void)_addNoFlagsKeywordMapping:(uint64_t)a1;
- (void)_addNoFlagsLegacyCategoryId:(uint64_t)a1;
- (void)_addNoFlagsModernToLegacyIdMapping:(uint64_t)a1;
- (void)_addNoFlagsNegativeCategory:(uint64_t)a1;
- (void)_readCanonicalNames;
- (void)_readCategoryIds;
- (void)_readExpandedCategoryIds;
- (void)_readLegacyCategoryIds;
- (void)_readNegativeCategorys;
- (void)addCanonicalName:(uint64_t)a1;
- (void)addCategoryId:(uint64_t)a1;
- (void)addCategoryMappings:(uint64_t)a1;
- (void)addExpandedCategoryId:(uint64_t)a1;
- (void)addFeatureMap:(uint64_t)a1;
- (void)addKeywordMapping:(uint64_t)a1;
- (void)addLegacyCategoryId:(uint64_t)a1;
- (void)addModernToLegacyIdMapping:(uint64_t)a1;
- (void)addNegativeCategory:(uint64_t)a1;
- (void)dealloc;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchCategoryIntent

- (GEOPDSearchCategoryIntent)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchCategoryIntent;
  v2 = [(GEOPDSearchCategoryIntent *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchCategoryIntent)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchCategoryIntent;
  v3 = [(GEOPDSearchCategoryIntent *)&v7 initWithData:a3];
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
  v3.super_class = (Class)GEOPDSearchCategoryIntent;
  [(GEOPDSearchCategoryIntent *)&v3 dealloc];
}

- (void)_readCategoryIds
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
  if ((*(_WORD *)(a1 + 140) & 4) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDSearchCategoryIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCategoryIds_tags_0);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
}

- (void)addCategoryId:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDSearchCategoryIntent _readCategoryIds](a1);
    -[GEOPDSearchCategoryIntent _addNoFlagsCategoryId:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 140) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
    *(_WORD *)(a1 + 140) |= 0x1000u;
  }
}

- (void)_addNoFlagsCategoryId:(uint64_t)a1
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

- (void)_readCanonicalNames
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
  if ((*(_WORD *)(a1 + 140) & 2) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDSearchCategoryIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCanonicalNames_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
}

- (void)addCanonicalName:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDSearchCategoryIntent _readCanonicalNames](a1);
    -[GEOPDSearchCategoryIntent _addNoFlagsCanonicalName:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 140) |= 2u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
    *(_WORD *)(a1 + 140) |= 0x1000u;
  }
}

- (void)_addNoFlagsCanonicalName:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 40);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v5;

      v4 = *(void **)(a1 + 40);
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 140) & 0x20) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchCategoryIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFeatureMaps_tags);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
    -[GEOPDSearchCategoryIntent _addNoFlagsFeatureMap:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 140) |= 0x20u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
    *(_WORD *)(a1 + 140) |= 0x1000u;
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

- (void)_readExpandedCategoryIds
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
  if ((*(_WORD *)(a1 + 140) & 0x10) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDSearchCategoryIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readExpandedCategoryIds_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
}

- (void)addExpandedCategoryId:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDSearchCategoryIntent _readExpandedCategoryIds](a1);
    -[GEOPDSearchCategoryIntent _addNoFlagsExpandedCategoryId:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 140) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
    *(_WORD *)(a1 + 140) |= 0x1000u;
  }
}

- (void)_addNoFlagsExpandedCategoryId:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 64);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = v5;

      v4 = *(void **)(a1 + 64);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readNegativeCategorys
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
  if ((*(_WORD *)(a1 + 140) & 0x200) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDSearchCategoryIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNegativeCategorys_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
}

- (void)addNegativeCategory:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDSearchCategoryIntent _readNegativeCategorys](a1);
    -[GEOPDSearchCategoryIntent _addNoFlagsNegativeCategory:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 140) |= 0x200u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
    *(_WORD *)(a1 + 140) |= 0x1000u;
  }
}

- (void)_addNoFlagsNegativeCategory:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 104);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 104);
      *(void *)(a1 + 104) = v5;

      v4 = *(void **)(a1 + 104);
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 140) & 0x100) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchCategoryIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readModernToLegacyIdMappings_tags);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
    -[GEOPDSearchCategoryIntent _addNoFlagsModernToLegacyIdMapping:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 140) |= 0x100u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
    *(_WORD *)(a1 + 140) |= 0x1000u;
  }
}

- (void)_addNoFlagsModernToLegacyIdMapping:(uint64_t)a1
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

- (void)_readLegacyCategoryIds
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
  if ((*(_WORD *)(a1 + 140) & 0x80) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDSearchCategoryIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLegacyCategoryIds_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
}

- (void)addLegacyCategoryId:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDSearchCategoryIntent _readLegacyCategoryIds](a1);
    -[GEOPDSearchCategoryIntent _addNoFlagsLegacyCategoryId:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 140) |= 0x80u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
    *(_WORD *)(a1 + 140) |= 0x1000u;
  }
}

- (void)_addNoFlagsLegacyCategoryId:(uint64_t)a1
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

- (void)addCategoryMappings:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 140) & 8) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchCategoryIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCategoryMappings_tags);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
    -[GEOPDSearchCategoryIntent _addNoFlagsCategoryMappings:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 140) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
    *(_WORD *)(a1 + 140) |= 0x1000u;
  }
}

- (void)_addNoFlagsCategoryMappings:(uint64_t)a1
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

- (void)addKeywordMapping:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 140) & 0x40) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchCategoryIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readKeywordMappings_tags_391);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
    -[GEOPDSearchCategoryIntent _addNoFlagsKeywordMapping:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 140) |= 0x40u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
    *(_WORD *)(a1 + 140) |= 0x1000u;
  }
}

- (void)_addNoFlagsKeywordMapping:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 80);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 80);
      *(void *)(a1 + 80) = v5;

      v4 = *(void **)(a1 + 80);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchCategoryIntent;
  v4 = [(GEOPDSearchCategoryIntent *)&v8 description];
  id v5 = [(GEOPDSearchCategoryIntent *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchCategoryIntent _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDSearchCategoryIntent readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 140) & 0x800) == 0)
    {
      id v5 = *(void **)(a1 + 8);
      if (v5)
      {
        id v6 = v5;
        objc_sync_enter(v6);
        GEOPDSearchCategoryIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTrigger_tags);
        objc_sync_exit(v6);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
    id v7 = *(id *)(a1 + 120);
    if (v7) {
      [v4 setObject:v7 forKey:@"trigger"];
    }

    if (*(void *)(a1 + 48))
    {
      -[GEOPDSearchCategoryIntent _readCategoryIds](a1);
      id v8 = *(id *)(a1 + 48);
      if (a2) {
        v9 = @"categoryId";
      }
      else {
        v9 = @"category_id";
      }
      [v4 setObject:v8 forKey:v9];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 140) & 0x400) == 0)
    {
      v10 = *(void **)(a1 + 8);
      if (v10)
      {
        id v11 = v10;
        objc_sync_enter(v11);
        GEOPDSearchCategoryIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTokenSet_tags_386);
        objc_sync_exit(v11);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
    id v12 = *(id *)(a1 + 112);
    v13 = v12;
    if (v12)
    {
      if (a2)
      {
        v14 = [v12 jsonRepresentation];
        v15 = @"tokenSet";
      }
      else
      {
        v14 = [v12 dictionaryRepresentation];
        v15 = @"token_set";
      }
      [v4 setObject:v14 forKey:v15];
    }
    if (*(void *)(a1 + 40))
    {
      -[GEOPDSearchCategoryIntent _readCanonicalNames](a1);
      id v16 = *(id *)(a1 + 40);
      if (a2) {
        v17 = @"canonicalName";
      }
      else {
        v17 = @"canonical_name";
      }
      [v4 setObject:v16 forKey:v17];
    }
    if ([*(id *)(a1 + 72) count])
    {
      v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 72), "count"));
      long long v71 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      id v19 = *(id *)(a1 + 72);
      uint64_t v20 = [v19 countByEnumeratingWithState:&v71 objects:v78 count:16];
      if (v20)
      {
        uint64_t v21 = *(void *)v72;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v72 != v21) {
              objc_enumerationMutation(v19);
            }
            v23 = *(void **)(*((void *)&v71 + 1) + 8 * i);
            if (a2) {
              [v23 jsonRepresentation];
            }
            else {
            v24 = [v23 dictionaryRepresentation];
            }
            [v18 addObject:v24];
          }
          uint64_t v20 = [v19 countByEnumeratingWithState:&v71 objects:v78 count:16];
        }
        while (v20);
      }

      if (a2) {
        v25 = @"featureMap";
      }
      else {
        v25 = @"feature_map";
      }
      [v4 setObject:v18 forKey:v25];
    }
    if (*(void *)(a1 + 64))
    {
      -[GEOPDSearchCategoryIntent _readExpandedCategoryIds](a1);
      id v26 = *(id *)(a1 + 64);
      if (a2) {
        v27 = @"expandedCategoryId";
      }
      else {
        v27 = @"expanded_category_id";
      }
      [v4 setObject:v26 forKey:v27];
    }
    if (*(void *)(a1 + 104))
    {
      -[GEOPDSearchCategoryIntent _readNegativeCategorys](a1);
      id v28 = *(id *)(a1 + 104);
      if (a2) {
        v29 = @"negativeCategory";
      }
      else {
        v29 = @"negative_category";
      }
      [v4 setObject:v28 forKey:v29];
    }
    if ([*(id *)(a1 + 96) count])
    {
      v30 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 96), "count"));
      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      id v31 = *(id *)(a1 + 96);
      uint64_t v32 = [v31 countByEnumeratingWithState:&v67 objects:v77 count:16];
      if (v32)
      {
        uint64_t v33 = *(void *)v68;
        do
        {
          for (uint64_t j = 0; j != v32; ++j)
          {
            if (*(void *)v68 != v33) {
              objc_enumerationMutation(v31);
            }
            v35 = *(void **)(*((void *)&v67 + 1) + 8 * j);
            if (a2) {
              [v35 jsonRepresentation];
            }
            else {
            v36 = [v35 dictionaryRepresentation];
            }
            [v30 addObject:v36];
          }
          uint64_t v32 = [v31 countByEnumeratingWithState:&v67 objects:v77 count:16];
        }
        while (v32);
      }

      if (a2) {
        v37 = @"modernToLegacyIdMapping";
      }
      else {
        v37 = @"modern_to_legacy_id_mapping";
      }
      [v4 setObject:v30 forKey:v37];
    }
    if (*(void *)(a1 + 24))
    {
      v38 = PBRepeatedUInt64NSArray();
      if (a2) {
        v39 = @"keywordMuid";
      }
      else {
        v39 = @"keyword_muid";
      }
      [v4 setObject:v38 forKey:v39];
    }
    if (*(void *)(a1 + 88))
    {
      -[GEOPDSearchCategoryIntent _readLegacyCategoryIds](a1);
      id v40 = *(id *)(a1 + 88);
      if (a2) {
        v41 = @"legacyCategoryId";
      }
      else {
        v41 = @"legacy_category_id";
      }
      [v4 setObject:v40 forKey:v41];
    }
    if ([*(id *)(a1 + 56) count])
    {
      v42 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      id v43 = *(id *)(a1 + 56);
      uint64_t v44 = [v43 countByEnumeratingWithState:&v63 objects:v76 count:16];
      if (v44)
      {
        uint64_t v45 = *(void *)v64;
        do
        {
          for (uint64_t k = 0; k != v44; ++k)
          {
            if (*(void *)v64 != v45) {
              objc_enumerationMutation(v43);
            }
            v47 = *(void **)(*((void *)&v63 + 1) + 8 * k);
            if (a2) {
              [v47 jsonRepresentation];
            }
            else {
            v48 = [v47 dictionaryRepresentation];
            }
            [v42 addObject:v48];
          }
          uint64_t v44 = [v43 countByEnumeratingWithState:&v63 objects:v76 count:16];
        }
        while (v44);
      }

      if (a2) {
        v49 = @"categoryMappings";
      }
      else {
        v49 = @"category_mappings";
      }
      [v4 setObject:v42 forKey:v49];
    }
    if ([*(id *)(a1 + 80) count])
    {
      v50 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 80), "count"));
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      id v51 = *(id *)(a1 + 80);
      uint64_t v52 = [v51 countByEnumeratingWithState:&v59 objects:v75 count:16];
      if (v52)
      {
        uint64_t v53 = *(void *)v60;
        do
        {
          for (uint64_t m = 0; m != v52; ++m)
          {
            if (*(void *)v60 != v53) {
              objc_enumerationMutation(v51);
            }
            v55 = *(void **)(*((void *)&v59 + 1) + 8 * m);
            if (a2) {
              [v55 jsonRepresentation];
            }
            else {
            v56 = objc_msgSend(v55, "dictionaryRepresentation", (void)v59);
            }
            objc_msgSend(v50, "addObject:", v56, (void)v59);
          }
          uint64_t v52 = [v51 countByEnumeratingWithState:&v59 objects:v75 count:16];
        }
        while (v52);
      }

      if (a2) {
        v57 = @"keywordMapping";
      }
      else {
        v57 = @"keyword_mapping";
      }
      objc_msgSend(v4, "setObject:forKey:", v50, v57, (void)v59);
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
  return -[GEOPDSearchCategoryIntent _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_443;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_444;
      }
      GEOPDSearchCategoryIntentReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDSearchCategoryIntentCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchCategoryIntentReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDSearchCategoryIntentIsDirty((uint64_t)self) & 1) == 0)
  {
    id v43 = self->_reader;
    objc_sync_enter(v43);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v44 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v44];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v43);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchCategoryIntent readAll:]((uint64_t)self, 0);
    if (self->_trigger) {
      PBDataWriterWriteStringField();
    }
    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    id v6 = self->_categoryIds;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v77 objects:v89 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v78;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v78 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v77 objects:v89 count:16];
      }
      while (v7);
    }

    if (self->_tokenSet) {
      PBDataWriterWriteSubmessage();
    }
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    v10 = self->_canonicalNames;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v73 objects:v88 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v74;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v74 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v73 objects:v88 count:16];
      }
      while (v11);
    }

    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    v14 = self->_featureMaps;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v69 objects:v87 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v70;
      do
      {
        for (uint64_t k = 0; k != v15; ++k)
        {
          if (*(void *)v70 != v16) {
            objc_enumerationMutation(v14);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v69 objects:v87 count:16];
      }
      while (v15);
    }

    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    v18 = self->_expandedCategoryIds;
    uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v65 objects:v86 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v66;
      do
      {
        for (uint64_t m = 0; m != v19; ++m)
        {
          if (*(void *)v66 != v20) {
            objc_enumerationMutation(v18);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v65 objects:v86 count:16];
      }
      while (v19);
    }

    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    v22 = self->_negativeCategorys;
    uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v61 objects:v85 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v62;
      do
      {
        for (uint64_t n = 0; n != v23; ++n)
        {
          if (*(void *)v62 != v24) {
            objc_enumerationMutation(v22);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v61 objects:v85 count:16];
      }
      while (v23);
    }

    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v26 = self->_modernToLegacyIdMappings;
    uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v57 objects:v84 count:16];
    if (v27)
    {
      uint64_t v28 = *(void *)v58;
      do
      {
        for (iuint64_t i = 0; ii != v27; ++ii)
        {
          if (*(void *)v58 != v28) {
            objc_enumerationMutation(v26);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v57 objects:v84 count:16];
      }
      while (v27);
    }

    if (self->_keywordMuids.count)
    {
      unint64_t v30 = 0;
      do
      {
        PBDataWriterWriteUint64Field();
        ++v30;
      }
      while (v30 < self->_keywordMuids.count);
    }
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v31 = self->_legacyCategoryIds;
    uint64_t v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v53 objects:v83 count:16];
    if (v32)
    {
      uint64_t v33 = *(void *)v54;
      do
      {
        for (juint64_t j = 0; jj != v32; ++jj)
        {
          if (*(void *)v54 != v33) {
            objc_enumerationMutation(v31);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v53 objects:v83 count:16];
      }
      while (v32);
    }

    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    v35 = self->_categoryMappings;
    uint64_t v36 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v49 objects:v82 count:16];
    if (v36)
    {
      uint64_t v37 = *(void *)v50;
      do
      {
        for (kuint64_t k = 0; kk != v36; ++kk)
        {
          if (*(void *)v50 != v37) {
            objc_enumerationMutation(v35);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v36 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v49 objects:v82 count:16];
      }
      while (v36);
    }

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    v39 = self->_keywordMappings;
    uint64_t v40 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v45 objects:v81 count:16];
    if (v40)
    {
      uint64_t v41 = *(void *)v46;
      do
      {
        for (muint64_t m = 0; mm != v40; ++mm)
        {
          if (*(void *)v46 != v41) {
            objc_enumerationMutation(v39);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v40 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v45 objects:v81 count:16];
      }
      while (v40);
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
      GEOPDSearchCategoryIntentReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchCategoryIntent readAll:]((uint64_t)self, 0);
  uint64_t v8 = [(NSString *)self->_trigger copyWithZone:a3];
  v9 = (void *)v5[15];
  v5[15] = v8;

  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  v10 = self->_categoryIds;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v90 objects:v102 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v91;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v91 != v12) {
          objc_enumerationMutation(v10);
        }
        v14 = (void *)[*(id *)(*((void *)&v90 + 1) + 8 * i) copyWithZone:a3];
        -[GEOPDSearchCategoryIntent addCategoryId:]((uint64_t)v5, v14);
      }
      uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v90 objects:v102 count:16];
    }
    while (v11);
  }

  id v15 = [(GEOPDSearchTokenSet *)self->_tokenSet copyWithZone:a3];
  uint64_t v16 = (void *)v5[14];
  v5[14] = v15;

  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  v17 = self->_canonicalNames;
  uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v86 objects:v101 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v87;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v87 != v19) {
          objc_enumerationMutation(v17);
        }
        uint64_t v21 = (void *)[*(id *)(*((void *)&v86 + 1) + 8 * j) copyWithZone:a3];
        -[GEOPDSearchCategoryIntent addCanonicalName:]((uint64_t)v5, v21);
      }
      uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v86 objects:v101 count:16];
    }
    while (v18);
  }

  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  v22 = self->_featureMaps;
  uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v82 objects:v100 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v83;
    do
    {
      for (uint64_t k = 0; k != v23; ++k)
      {
        if (*(void *)v83 != v24) {
          objc_enumerationMutation(v22);
        }
        id v26 = (void *)[*(id *)(*((void *)&v82 + 1) + 8 * k) copyWithZone:a3];
        -[GEOPDSearchCategoryIntent addFeatureMap:]((uint64_t)v5, v26);
      }
      uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v82 objects:v100 count:16];
    }
    while (v23);
  }

  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  uint64_t v27 = self->_expandedCategoryIds;
  uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v78 objects:v99 count:16];
  if (v28)
  {
    uint64_t v29 = *(void *)v79;
    do
    {
      for (uint64_t m = 0; m != v28; ++m)
      {
        if (*(void *)v79 != v29) {
          objc_enumerationMutation(v27);
        }
        id v31 = (void *)[*(id *)(*((void *)&v78 + 1) + 8 * m) copyWithZone:a3];
        -[GEOPDSearchCategoryIntent addExpandedCategoryId:]((uint64_t)v5, v31);
      }
      uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v78 objects:v99 count:16];
    }
    while (v28);
  }

  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  uint64_t v32 = self->_negativeCategorys;
  uint64_t v33 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v74 objects:v98 count:16];
  if (v33)
  {
    uint64_t v34 = *(void *)v75;
    do
    {
      for (uint64_t n = 0; n != v33; ++n)
      {
        if (*(void *)v75 != v34) {
          objc_enumerationMutation(v32);
        }
        uint64_t v36 = (void *)[*(id *)(*((void *)&v74 + 1) + 8 * n) copyWithZone:a3];
        -[GEOPDSearchCategoryIntent addNegativeCategory:]((uint64_t)v5, v36);
      }
      uint64_t v33 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v74 objects:v98 count:16];
    }
    while (v33);
  }

  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  uint64_t v37 = self->_modernToLegacyIdMappings;
  uint64_t v38 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v70 objects:v97 count:16];
  if (v38)
  {
    uint64_t v39 = *(void *)v71;
    do
    {
      for (iuint64_t i = 0; ii != v38; ++ii)
      {
        if (*(void *)v71 != v39) {
          objc_enumerationMutation(v37);
        }
        uint64_t v41 = (void *)[*(id *)(*((void *)&v70 + 1) + 8 * ii) copyWithZone:a3];
        -[GEOPDSearchCategoryIntent addModernToLegacyIdMapping:]((uint64_t)v5, v41);
      }
      uint64_t v38 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v70 objects:v97 count:16];
    }
    while (v38);
  }

  PBRepeatedUInt64Copy();
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  v42 = self->_legacyCategoryIds;
  uint64_t v43 = [(NSMutableArray *)v42 countByEnumeratingWithState:&v66 objects:v96 count:16];
  if (v43)
  {
    uint64_t v44 = *(void *)v67;
    do
    {
      for (juint64_t j = 0; jj != v43; ++jj)
      {
        if (*(void *)v67 != v44) {
          objc_enumerationMutation(v42);
        }
        long long v46 = (void *)[*(id *)(*((void *)&v66 + 1) + 8 * jj) copyWithZone:a3];
        -[GEOPDSearchCategoryIntent addLegacyCategoryId:]((uint64_t)v5, v46);
      }
      uint64_t v43 = [(NSMutableArray *)v42 countByEnumeratingWithState:&v66 objects:v96 count:16];
    }
    while (v43);
  }

  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v47 = self->_categoryMappings;
  uint64_t v48 = [(NSMutableArray *)v47 countByEnumeratingWithState:&v62 objects:v95 count:16];
  if (v48)
  {
    uint64_t v49 = *(void *)v63;
    do
    {
      for (kuint64_t k = 0; kk != v48; ++kk)
      {
        if (*(void *)v63 != v49) {
          objc_enumerationMutation(v47);
        }
        long long v51 = (void *)[*(id *)(*((void *)&v62 + 1) + 8 * kk) copyWithZone:a3];
        -[GEOPDSearchCategoryIntent addCategoryMappings:]((uint64_t)v5, v51);
      }
      uint64_t v48 = [(NSMutableArray *)v47 countByEnumeratingWithState:&v62 objects:v95 count:16];
    }
    while (v48);
  }

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v52 = self->_keywordMappings;
  uint64_t v53 = [(NSMutableArray *)v52 countByEnumeratingWithState:&v58 objects:v94 count:16];
  if (v53)
  {
    uint64_t v54 = *(void *)v59;
    do
    {
      for (muint64_t m = 0; mm != v53; ++mm)
      {
        if (*(void *)v59 != v54) {
          objc_enumerationMutation(v52);
        }
        long long v56 = objc_msgSend(*(id *)(*((void *)&v58 + 1) + 8 * mm), "copyWithZone:", a3, (void)v58);
        -[GEOPDSearchCategoryIntent addKeywordMapping:]((uint64_t)v5, v56);
      }
      uint64_t v53 = [(NSMutableArray *)v52 countByEnumeratingWithState:&v58 objects:v94 count:16];
    }
    while (v53);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_25;
  }
  -[GEOPDSearchCategoryIntent readAll:]((uint64_t)self, 1);
  -[GEOPDSearchCategoryIntent readAll:]((uint64_t)v4, 1);
  trigger = self->_trigger;
  if ((unint64_t)trigger | v4[15])
  {
    if (!-[NSString isEqual:](trigger, "isEqual:")) {
      goto LABEL_25;
    }
  }
  categoryIds = self->_categoryIds;
  if ((unint64_t)categoryIds | v4[6] && !-[NSMutableArray isEqual:](categoryIds, "isEqual:")) {
    goto LABEL_25;
  }
  tokenSet = self->_tokenSet;
  if ((unint64_t)tokenSet | v4[14] && !-[GEOPDSearchTokenSet isEqual:](tokenSet, "isEqual:")) {
    goto LABEL_25;
  }
  if (((canonicalNames = self->_canonicalNames, !((unint64_t)canonicalNames | v4[5]))
     || -[NSMutableArray isEqual:](canonicalNames, "isEqual:"))
    && ((featureMaps = self->_featureMaps, !((unint64_t)featureMaps | v4[9]))
     || -[NSMutableArray isEqual:](featureMaps, "isEqual:"))
    && ((expandedCategoryIds = self->_expandedCategoryIds, !((unint64_t)expandedCategoryIds | v4[8]))
     || -[NSMutableArray isEqual:](expandedCategoryIds, "isEqual:"))
    && ((negativeCategorys = self->_negativeCategorys, !((unint64_t)negativeCategorys | v4[13]))
     || -[NSMutableArray isEqual:](negativeCategorys, "isEqual:"))
    && ((modernToLegacyIdMappings = self->_modernToLegacyIdMappings,
         !((unint64_t)modernToLegacyIdMappings | v4[12]))
     || -[NSMutableArray isEqual:](modernToLegacyIdMappings, "isEqual:"))
    && PBRepeatedUInt64IsEqual()
    && ((legacyCategoryIds = self->_legacyCategoryIds, !((unint64_t)legacyCategoryIds | v4[11]))
     || -[NSMutableArray isEqual:](legacyCategoryIds, "isEqual:"))
    && ((categoryMappings = self->_categoryMappings, !((unint64_t)categoryMappings | v4[7]))
     || -[NSMutableArray isEqual:](categoryMappings, "isEqual:")))
  {
    keywordMappings = self->_keywordMappings;
    if ((unint64_t)keywordMappings | v4[10]) {
      char v16 = -[NSMutableArray isEqual:](keywordMappings, "isEqual:");
    }
    else {
      char v16 = 1;
    }
  }
  else
  {
LABEL_25:
    char v16 = 0;
  }

  return v16;
}

- (unint64_t)hash
{
  -[GEOPDSearchCategoryIntent readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_trigger hash];
  uint64_t v4 = [(NSMutableArray *)self->_categoryIds hash] ^ v3;
  unint64_t v5 = [(GEOPDSearchTokenSet *)self->_tokenSet hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSMutableArray *)self->_canonicalNames hash];
  uint64_t v7 = [(NSMutableArray *)self->_featureMaps hash];
  uint64_t v8 = v7 ^ [(NSMutableArray *)self->_expandedCategoryIds hash];
  uint64_t v9 = v6 ^ v8 ^ [(NSMutableArray *)self->_negativeCategorys hash];
  uint64_t v10 = [(NSMutableArray *)self->_modernToLegacyIdMappings hash];
  uint64_t v11 = v10 ^ PBRepeatedUInt64Hash();
  uint64_t v12 = v11 ^ [(NSMutableArray *)self->_legacyCategoryIds hash];
  uint64_t v13 = v9 ^ v12 ^ [(NSMutableArray *)self->_categoryMappings hash];
  return v13 ^ [(NSMutableArray *)self->_keywordMappings hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trigger, 0);
  objc_storeStrong((id *)&self->_tokenSet, 0);
  objc_storeStrong((id *)&self->_negativeCategorys, 0);
  objc_storeStrong((id *)&self->_modernToLegacyIdMappings, 0);
  objc_storeStrong((id *)&self->_legacyCategoryIds, 0);
  objc_storeStrong((id *)&self->_keywordMappings, 0);
  objc_storeStrong((id *)&self->_featureMaps, 0);
  objc_storeStrong((id *)&self->_expandedCategoryIds, 0);
  objc_storeStrong((id *)&self->_categoryMappings, 0);
  objc_storeStrong((id *)&self->_categoryIds, 0);
  objc_storeStrong((id *)&self->_canonicalNames, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end