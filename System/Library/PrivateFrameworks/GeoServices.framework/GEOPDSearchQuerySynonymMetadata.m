@interface GEOPDSearchQuerySynonymMetadata
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSearchQuerySynonymMetadata)init;
- (GEOPDSearchQuerySynonymMetadata)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (unint64_t)hash;
- (void)_addNoFlagsFeatureMap:(uint64_t)a1;
- (void)_addNoFlagsGeoHashes:(uint64_t)a1;
- (void)_addNoFlagsRefinementQueries:(uint64_t)a1;
- (void)_readGeoHashes;
- (void)_readRefinementQueries;
- (void)addFeatureMap:(uint64_t)a1;
- (void)addGeoHashes:(os_unfair_lock_s *)a1;
- (void)addRefinementQueries:(os_unfair_lock_s *)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchQuerySynonymMetadata

- (GEOPDSearchQuerySynonymMetadata)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchQuerySynonymMetadata;
  v2 = [(GEOPDSearchQuerySynonymMetadata *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchQuerySynonymMetadata)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchQuerySynonymMetadata;
  v3 = [(GEOPDSearchQuerySynonymMetadata *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readRefinementQueries
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
  if ((*(unsigned char *)(a1 + 117) & 0x40) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDSearchQuerySynonymMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRefinementQueries_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
}

- (void)addRefinementQueries:(os_unfair_lock_s *)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDSearchQuerySynonymMetadata _readRefinementQueries]((uint64_t)a1);
    -[GEOPDSearchQuerySynonymMetadata _addNoFlagsRefinementQueries:]((uint64_t)a1, v3);

    os_unfair_lock_lock_with_options();
    a1[29]._os_unfair_lock_opaque |= 0x4000u;
    os_unfair_lock_unlock(a1 + 24);
    a1[29]._os_unfair_lock_opaque |= 0x10000u;
  }
}

- (void)_addNoFlagsRefinementQueries:(uint64_t)a1
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

- (void)_readGeoHashes
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
  if ((*(unsigned char *)(a1 + 117) & 4) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDSearchQuerySynonymMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readGeoHashes_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
}

- (void)addGeoHashes:(os_unfair_lock_s *)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDSearchQuerySynonymMetadata _readGeoHashes]((uint64_t)a1);
    -[GEOPDSearchQuerySynonymMetadata _addNoFlagsGeoHashes:]((uint64_t)a1, v3);

    os_unfair_lock_lock_with_options();
    a1[29]._os_unfair_lock_opaque |= 0x400u;
    os_unfair_lock_unlock(a1 + 24);
    a1[29]._os_unfair_lock_opaque |= 0x10000u;
  }
}

- (void)_addNoFlagsGeoHashes:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 32);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v5;

      v4 = *(void **)(a1 + 32);
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(unsigned char *)(a1 + 117) & 2) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchQuerySynonymMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFeatureMaps_tags_2062);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    -[GEOPDSearchQuerySynonymMetadata _addNoFlagsFeatureMap:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_DWORD *)(a1 + 116) |= 0x200u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    *(_DWORD *)(a1 + 116) |= 0x10000u;
  }
}

- (void)_addNoFlagsFeatureMap:(uint64_t)a1
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
  v8.super_class = (Class)GEOPDSearchQuerySynonymMetadata;
  v4 = [(GEOPDSearchQuerySynonymMetadata *)&v8 description];
  id v5 = [(GEOPDSearchQuerySynonymMetadata *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchQuerySynonymMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDSearchQuerySynonymMetadata readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 116))
    {
      id v5 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
      [v4 setObject:v5 forKey:@"id"];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(unsigned char *)(a1 + 117) & 8) == 0)
    {
      objc_super v6 = *(void **)(a1 + 8);
      if (v6)
      {
        id v7 = v6;
        objc_sync_enter(v7);
        GEOPDSearchQuerySynonymMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readKey_tags_1);
        objc_sync_exit(v7);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    id v8 = *(id *)(a1 + 48);
    if (v8) {
      [v4 setObject:v8 forKey:@"key"];
    }

    if (*(void *)(a1 + 72))
    {
      -[GEOPDSearchQuerySynonymMetadata _readRefinementQueries](a1);
      id v9 = *(id *)(a1 + 72);
      if (a2) {
        v10 = @"refinementQueries";
      }
      else {
        v10 = @"refinement_queries";
      }
      [v4 setObject:v9 forKey:v10];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(unsigned char *)(a1 + 117) & 0x10) == 0)
    {
      v11 = *(void **)(a1 + 8);
      if (v11)
      {
        id v12 = v11;
        objc_sync_enter(v12);
        GEOPDSearchQuerySynonymMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLanguage_tags_0);
        objc_sync_exit(v12);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    id v13 = *(id *)(a1 + 56);
    if (v13) {
      [v4 setObject:v13 forKey:@"language"];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(unsigned char *)(a1 + 117) & 1) == 0)
    {
      v14 = *(void **)(a1 + 8);
      if (v14)
      {
        id v15 = v14;
        objc_sync_enter(v15);
        GEOPDSearchQuerySynonymMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCountryCode_tags_2061);
        objc_sync_exit(v15);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    id v16 = *(id *)(a1 + 16);
    if (v16)
    {
      if (a2) {
        v17 = @"countryCode";
      }
      else {
        v17 = @"country_code";
      }
      [v4 setObject:v16 forKey:v17];
    }

    if (*(void *)(a1 + 32))
    {
      -[GEOPDSearchQuerySynonymMetadata _readGeoHashes](a1);
      id v19 = *(id *)(a1 + 32);
      if (a2) {
        v20 = @"geoHashes";
      }
      else {
        v20 = @"geo_hashes";
      }
      [v4 setObject:v19 forKey:v20];
    }
    int v21 = *(_DWORD *)(a1 + 116);
    if ((v21 & 2) != 0)
    {
      LODWORD(v18) = *(_DWORD *)(a1 + 100);
      v22 = [NSNumber numberWithFloat:v18];
      [v4 setObject:v22 forKey:@"confidence"];

      int v21 = *(_DWORD *)(a1 + 116);
    }
    if ((v21 & 8) != 0)
    {
      uint64_t v23 = *(int *)(a1 + 108);
      if (v23 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 108));
        v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v24 = off_1E53E2AB0[v23];
      }
      if (a2) {
        v25 = @"rewriteProvider";
      }
      else {
        v25 = @"rewrite_provider";
      }
      [v4 setObject:v24 forKey:v25];

      int v21 = *(_DWORD *)(a1 + 116);
    }
    if ((v21 & 0x80) != 0)
    {
      v26 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 115)];
      if (a2) {
        v27 = @"useGeoHashes";
      }
      else {
        v27 = @"use_geo_hashes";
      }
      [v4 setObject:v26 forKey:v27];

      int v21 = *(_DWORD *)(a1 + 116);
    }
    if ((v21 & 0x10) != 0)
    {
      v28 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 112)];
      if (a2) {
        v29 = @"hardRewrite";
      }
      else {
        v29 = @"hard_rewrite";
      }
      [v4 setObject:v28 forKey:v29];

      int v21 = *(_DWORD *)(a1 + 116);
    }
    if ((v21 & 4) != 0)
    {
      uint64_t v30 = *(int *)(a1 + 104);
      if (v30 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 104));
        v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v31 = off_1E53E2AB0[v30];
      }
      if (a2) {
        v32 = @"originalProvider";
      }
      else {
        v32 = @"original_provider";
      }
      [v4 setObject:v31 forKey:v32];

      int v21 = *(_DWORD *)(a1 + 116);
    }
    if ((v21 & 0x40) != 0)
    {
      v33 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 114)];
      if (a2) {
        v34 = @"isWeakLexicalMatch";
      }
      else {
        v34 = @"is_weak_lexical_match";
      }
      [v4 setObject:v33 forKey:v34];

      int v21 = *(_DWORD *)(a1 + 116);
    }
    if ((v21 & 0x20) != 0)
    {
      v35 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 113)];
      if (a2) {
        v36 = @"isOrgQueryPrefixOfRefinement";
      }
      else {
        v36 = @"is_org_query_prefix_of_refinement";
      }
      [v4 setObject:v35 forKey:v36];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(unsigned char *)(a1 + 117) & 0x20) == 0)
    {
      v37 = *(void **)(a1 + 8);
      if (v37)
      {
        id v38 = v37;
        objc_sync_enter(v38);
        GEOPDSearchQuerySynonymMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOriginalQueryDisplayString_tags);
        objc_sync_exit(v38);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    id v39 = *(id *)(a1 + 64);
    if (v39)
    {
      if (a2) {
        v40 = @"originalQueryDisplayString";
      }
      else {
        v40 = @"original_query_display_string";
      }
      [v4 setObject:v39 forKey:v40];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(unsigned char *)(a1 + 117) & 0x80) == 0)
    {
      v41 = *(void **)(a1 + 8);
      if (v41)
      {
        id v42 = v41;
        objc_sync_enter(v42);
        GEOPDSearchQuerySynonymMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSynonymQueryDisplayString_tags);
        objc_sync_exit(v42);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    id v43 = *(id *)(a1 + 80);
    if (v43)
    {
      if (a2) {
        v44 = @"synonymQueryDisplayString";
      }
      else {
        v44 = @"synonym_query_display_string";
      }
      [v4 setObject:v43 forKey:v44];
    }

    if ([*(id *)(a1 + 24) count])
    {
      v45 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id v46 = *(id *)(a1 + 24);
      uint64_t v47 = [v46 countByEnumeratingWithState:&v54 objects:v58 count:16];
      if (v47)
      {
        uint64_t v48 = *(void *)v55;
        do
        {
          for (uint64_t i = 0; i != v47; ++i)
          {
            if (*(void *)v55 != v48) {
              objc_enumerationMutation(v46);
            }
            v50 = *(void **)(*((void *)&v54 + 1) + 8 * i);
            if (a2) {
              [v50 jsonRepresentation];
            }
            else {
            v51 = [v50 dictionaryRepresentation];
            }
            [v45 addObject:v51];
          }
          uint64_t v47 = [v46 countByEnumeratingWithState:&v54 objects:v58 count:16];
        }
        while (v47);
      }

      if (a2) {
        v52 = @"featureMap";
      }
      else {
        v52 = @"feature_map";
      }
      [v4 setObject:v45 forKey:v52];
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
  return -[GEOPDSearchQuerySynonymMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
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
        objc_super v6 = (int *)&readAll__recursiveTag_2132;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_2133;
      }
      GEOPDSearchQuerySynonymMetadataReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDSearchQuerySynonymMetadataCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = [a1 init];
  if (!v6) {
    goto LABEL_126;
  }
  id v7 = [v5 objectForKeyedSubscript:@"id"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v7 unsignedLongLongValue];
    *(_DWORD *)(v6 + 116) |= 0x10000u;
    *(_DWORD *)(v6 + 116) |= 1u;
    *(void *)(v6 + 40) = v8;
  }

  id v9 = [v5 objectForKeyedSubscript:@"key"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = (void *)[v9 copy];
    id v11 = v10;
    *(_DWORD *)(v6 + 116) |= 0x800u;
    *(_DWORD *)(v6 + 116) |= 0x10000u;
    objc_storeStrong((id *)(v6 + 48), v10);
  }
  if (a3) {
    id v12 = @"refinementQueries";
  }
  else {
    id v12 = @"refinement_queries";
  }
  id v13 = [v5 objectForKeyedSubscript:v12];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    id v14 = v13;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v87 objects:v93 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v88;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v88 != v17) {
            objc_enumerationMutation(v14);
          }
          id v19 = *(void **)(*((void *)&v87 + 1) + 8 * v18);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v20 = (void *)[v19 copy];
            -[GEOPDSearchQuerySynonymMetadata addRefinementQueries:]((os_unfair_lock_s *)v6, v20);
          }
          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v87 objects:v93 count:16];
      }
      while (v16);
    }
  }
  int v21 = [v5 objectForKeyedSubscript:@"language"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v22 = (void *)[v21 copy];
    id v23 = v22;
    *(_DWORD *)(v6 + 116) |= 0x1000u;
    *(_DWORD *)(v6 + 116) |= 0x10000u;
    objc_storeStrong((id *)(v6 + 56), v22);
  }
  if (a3) {
    v24 = @"countryCode";
  }
  else {
    v24 = @"country_code";
  }
  v25 = [v5 objectForKeyedSubscript:v24];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v26 = (void *)[v25 copy];
    id v27 = v26;
    *(_DWORD *)(v6 + 116) |= 0x100u;
    *(_DWORD *)(v6 + 116) |= 0x10000u;
    objc_storeStrong((id *)(v6 + 16), v26);
  }
  if (a3) {
    v28 = @"geoHashes";
  }
  else {
    v28 = @"geo_hashes";
  }
  v29 = [v5 objectForKeyedSubscript:v28];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    id v30 = v29;
    uint64_t v31 = [v30 countByEnumeratingWithState:&v83 objects:v92 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v84;
      do
      {
        uint64_t v34 = 0;
        do
        {
          if (*(void *)v84 != v33) {
            objc_enumerationMutation(v30);
          }
          v35 = *(void **)(*((void *)&v83 + 1) + 8 * v34);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v36 = (void *)[v35 copy];
            -[GEOPDSearchQuerySynonymMetadata addGeoHashes:]((os_unfair_lock_s *)v6, v36);
          }
          ++v34;
        }
        while (v32 != v34);
        uint64_t v32 = [v30 countByEnumeratingWithState:&v83 objects:v92 count:16];
      }
      while (v32);
    }
  }
  v37 = [v5 objectForKeyedSubscript:@"confidence"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v37 floatValue];
    *(_DWORD *)(v6 + 116) |= 0x10000u;
    *(_DWORD *)(v6 + 116) |= 2u;
    *(_DWORD *)(v6 + 100) = v38;
  }

  if (a3) {
    id v39 = @"rewriteProvider";
  }
  else {
    id v39 = @"rewrite_provider";
  }
  v40 = [v5 objectForKeyedSubscript:v39];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v41 = v40;
    if ([v41 isEqualToString:@"NONE_TYPE"])
    {
      int v42 = 0;
    }
    else if ([v41 isEqualToString:@"FWDGEO"])
    {
      int v42 = 1;
    }
    else if ([v41 isEqualToString:@"LOCALSEARCH"])
    {
      int v42 = 2;
    }
    else if ([v41 isEqualToString:@"POIGEOMIXED"])
    {
      int v42 = 3;
    }
    else
    {
      int v42 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_60;
    }
    int v42 = [v40 intValue];
  }
  *(_DWORD *)(v6 + 116) |= 0x10000u;
  *(_DWORD *)(v6 + 116) |= 8u;
  *(_DWORD *)(v6 + 108) = v42;
LABEL_60:

  if (a3) {
    id v43 = @"useGeoHashes";
  }
  else {
    id v43 = @"use_geo_hashes";
  }
  v44 = [v5 objectForKeyedSubscript:v43];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v45 = [v44 BOOLValue];
    *(_DWORD *)(v6 + 116) |= 0x10000u;
    *(_DWORD *)(v6 + 116) |= 0x80u;
    *(unsigned char *)(v6 + 115) = v45;
  }

  if (a3) {
    id v46 = @"hardRewrite";
  }
  else {
    id v46 = @"hard_rewrite";
  }
  uint64_t v47 = [v5 objectForKeyedSubscript:v46];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v48 = [v47 BOOLValue];
    *(_DWORD *)(v6 + 116) |= 0x10000u;
    *(_DWORD *)(v6 + 116) |= 0x10u;
    *(unsigned char *)(v6 + 112) = v48;
  }

  if (a3) {
    v49 = @"originalProvider";
  }
  else {
    v49 = @"original_provider";
  }
  v50 = [v5 objectForKeyedSubscript:v49];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v51 = v50;
    if ([v51 isEqualToString:@"NONE_TYPE"])
    {
      int v52 = 0;
    }
    else if ([v51 isEqualToString:@"FWDGEO"])
    {
      int v52 = 1;
    }
    else if ([v51 isEqualToString:@"LOCALSEARCH"])
    {
      int v52 = 2;
    }
    else if ([v51 isEqualToString:@"POIGEOMIXED"])
    {
      int v52 = 3;
    }
    else
    {
      int v52 = 0;
    }

    goto LABEL_86;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v52 = [v50 intValue];
LABEL_86:
    *(_DWORD *)(v6 + 116) |= 0x10000u;
    *(_DWORD *)(v6 + 116) |= 4u;
    *(_DWORD *)(v6 + 104) = v52;
  }

  if (a3) {
    v53 = @"isWeakLexicalMatch";
  }
  else {
    v53 = @"is_weak_lexical_match";
  }
  long long v54 = [v5 objectForKeyedSubscript:v53];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v55 = [v54 BOOLValue];
    *(_DWORD *)(v6 + 116) |= 0x10000u;
    *(_DWORD *)(v6 + 116) |= 0x40u;
    *(unsigned char *)(v6 + 114) = v55;
  }

  if (a3) {
    long long v56 = @"isOrgQueryPrefixOfRefinement";
  }
  else {
    long long v56 = @"is_org_query_prefix_of_refinement";
  }
  long long v57 = [v5 objectForKeyedSubscript:v56];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v58 = [v57 BOOLValue];
    *(_DWORD *)(v6 + 116) |= 0x10000u;
    *(_DWORD *)(v6 + 116) |= 0x20u;
    *(unsigned char *)(v6 + 113) = v58;
  }

  if (a3) {
    uint64_t v59 = @"originalQueryDisplayString";
  }
  else {
    uint64_t v59 = @"original_query_display_string";
  }
  v60 = [v5 objectForKeyedSubscript:v59];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v61 = (void *)[v60 copy];
    id v62 = v61;
    *(_DWORD *)(v6 + 116) |= 0x2000u;
    *(_DWORD *)(v6 + 116) |= 0x10000u;
    objc_storeStrong((id *)(v6 + 64), v61);
  }
  if (a3) {
    v63 = @"synonymQueryDisplayString";
  }
  else {
    v63 = @"synonym_query_display_string";
  }
  v64 = [v5 objectForKeyedSubscript:v63];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v65 = (void *)[v64 copy];
    id v66 = v65;
    *(_DWORD *)(v6 + 116) |= 0x8000u;
    *(_DWORD *)(v6 + 116) |= 0x10000u;
    objc_storeStrong((id *)(v6 + 80), v65);
  }
  if (a3) {
    v67 = @"featureMap";
  }
  else {
    v67 = @"feature_map";
  }
  v68 = [v5 objectForKeyedSubscript:v67];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id v69 = v68;
    uint64_t v70 = [v69 countByEnumeratingWithState:&v79 objects:v91 count:16];
    if (v70)
    {
      uint64_t v71 = v70;
      uint64_t v72 = *(void *)v80;
      do
      {
        uint64_t v73 = 0;
        do
        {
          if (*(void *)v80 != v72) {
            objc_enumerationMutation(v69);
          }
          v74 = *(void **)(*((void *)&v79 + 1) + 8 * v73);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v75 = [GEOPDSearchPair alloc];
            if (v75) {
              v76 = (void *)-[GEOPDSearchPair _initWithDictionary:isJSON:](v75, v74);
            }
            else {
              v76 = 0;
            }
            -[GEOPDSearchQuerySynonymMetadata addFeatureMap:](v6, v76);
          }
          ++v73;
        }
        while (v71 != v73);
        uint64_t v77 = [v69 countByEnumeratingWithState:&v79 objects:v91 count:16];
        uint64_t v71 = v77;
      }
      while (v77);
    }
  }
LABEL_126:

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchQuerySynonymMetadataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_DWORD *)&self->_flags & 0x1FF00) == 0))
  {
    id v19 = self->_reader;
    objc_sync_enter(v19);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v20 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v20];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v19);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchQuerySynonymMetadata readAll:]((uint64_t)self, 0);
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteUint64Field();
    }
    if (self->_key) {
      PBDataWriterWriteStringField();
    }
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v6 = self->_refinementQueries;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v30 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v29 objects:v35 count:16];
      }
      while (v7);
    }

    if (self->_language) {
      PBDataWriterWriteStringField();
    }
    if (self->_countryCode) {
      PBDataWriterWriteStringField();
    }
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v10 = self->_geoHashes;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v25 objects:v34 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v26;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v26 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v25 objects:v34 count:16];
      }
      while (v11);
    }

    $B96048FCA3CE9983CCDE492874E6FFA2 flags = self->_flags;
    if ((*(unsigned char *)&flags & 2) != 0)
    {
      PBDataWriterWriteFloatField();
      $B96048FCA3CE9983CCDE492874E6FFA2 flags = self->_flags;
    }
    if ((*(unsigned char *)&flags & 8) != 0)
    {
      PBDataWriterWriteInt32Field();
      $B96048FCA3CE9983CCDE492874E6FFA2 flags = self->_flags;
    }
    if ((*(unsigned char *)&flags & 0x80) != 0)
    {
      PBDataWriterWriteBOOLField();
      $B96048FCA3CE9983CCDE492874E6FFA2 flags = self->_flags;
    }
    if ((*(unsigned char *)&flags & 0x10) != 0)
    {
      PBDataWriterWriteBOOLField();
      $B96048FCA3CE9983CCDE492874E6FFA2 flags = self->_flags;
    }
    if ((*(unsigned char *)&flags & 4) != 0)
    {
      PBDataWriterWriteInt32Field();
      $B96048FCA3CE9983CCDE492874E6FFA2 flags = self->_flags;
    }
    if ((*(unsigned char *)&flags & 0x40) != 0)
    {
      PBDataWriterWriteBOOLField();
      $B96048FCA3CE9983CCDE492874E6FFA2 flags = self->_flags;
    }
    if ((*(unsigned char *)&flags & 0x20) != 0) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_originalQueryDisplayString) {
      PBDataWriterWriteStringField();
    }
    if (self->_synonymQueryDisplayString) {
      PBDataWriterWriteStringField();
    }
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v15 = self->_featureMaps;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v21 objects:v33 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v22;
      do
      {
        for (uint64_t k = 0; k != v16; ++k)
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v15);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v21 objects:v33 count:16];
      }
      while (v16);
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*((unsigned char *)&self->_flags + 2) & 1) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDSearchQuerySynonymMetadataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      uint64_t v8 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v7);

      goto LABEL_36;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchQuerySynonymMetadata readAll:]((uint64_t)self, 0);
  if (*(unsigned char *)&self->_flags)
  {
    *(void *)(v5 + 40) = self->_identifier;
    *(_DWORD *)(v5 + 116) |= 1u;
  }
  uint64_t v9 = [(NSString *)self->_key copyWithZone:a3];
  v10 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v9;

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v11 = self->_refinementQueries;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v44 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = (void *)[*(id *)(*((void *)&v43 + 1) + 8 * i) copyWithZone:a3];
        -[GEOPDSearchQuerySynonymMetadata addRefinementQueries:]((os_unfair_lock_s *)v5, v15);
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v43 objects:v49 count:16];
    }
    while (v12);
  }

  uint64_t v16 = [(NSString *)self->_language copyWithZone:a3];
  uint64_t v17 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v16;

  uint64_t v18 = [(NSString *)self->_countryCode copyWithZone:a3];
  id v19 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v18;

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v20 = self->_geoHashes;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v40;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v40 != v22) {
          objc_enumerationMutation(v20);
        }
        long long v24 = (void *)[*(id *)(*((void *)&v39 + 1) + 8 * j) copyWithZone:a3];
        -[GEOPDSearchQuerySynonymMetadata addGeoHashes:]((os_unfair_lock_s *)v5, v24);
      }
      uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v39 objects:v48 count:16];
    }
    while (v21);
  }

  $B96048FCA3CE9983CCDE492874E6FFA2 flags = self->_flags;
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    *(float *)(v5 + 100) = self->_confidence;
    *(_DWORD *)(v5 + 116) |= 2u;
    $B96048FCA3CE9983CCDE492874E6FFA2 flags = self->_flags;
    if ((*(unsigned char *)&flags & 8) == 0)
    {
LABEL_23:
      if ((*(unsigned char *)&flags & 0x80) == 0) {
        goto LABEL_24;
      }
      goto LABEL_39;
    }
  }
  else if ((*(unsigned char *)&flags & 8) == 0)
  {
    goto LABEL_23;
  }
  *(_DWORD *)(v5 + 108) = self->_rewriteProvider;
  *(_DWORD *)(v5 + 116) |= 8u;
  $B96048FCA3CE9983CCDE492874E6FFA2 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x80) == 0)
  {
LABEL_24:
    if ((*(unsigned char *)&flags & 0x10) == 0) {
      goto LABEL_25;
    }
    goto LABEL_40;
  }
LABEL_39:
  *(unsigned char *)(v5 + 115) = self->_useGeoHashes;
  *(_DWORD *)(v5 + 116) |= 0x80u;
  $B96048FCA3CE9983CCDE492874E6FFA2 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x10) == 0)
  {
LABEL_25:
    if ((*(unsigned char *)&flags & 4) == 0) {
      goto LABEL_26;
    }
    goto LABEL_41;
  }
LABEL_40:
  *(unsigned char *)(v5 + 112) = self->_hardRewrite;
  *(_DWORD *)(v5 + 116) |= 0x10u;
  $B96048FCA3CE9983CCDE492874E6FFA2 flags = self->_flags;
  if ((*(unsigned char *)&flags & 4) == 0)
  {
LABEL_26:
    if ((*(unsigned char *)&flags & 0x40) == 0) {
      goto LABEL_27;
    }
    goto LABEL_42;
  }
LABEL_41:
  *(_DWORD *)(v5 + 104) = self->_originalProvider;
  *(_DWORD *)(v5 + 116) |= 4u;
  $B96048FCA3CE9983CCDE492874E6FFA2 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x40) == 0)
  {
LABEL_27:
    if ((*(unsigned char *)&flags & 0x20) == 0) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
LABEL_42:
  *(unsigned char *)(v5 + 114) = self->_isWeakLexicalMatch;
  *(_DWORD *)(v5 + 116) |= 0x40u;
  if ((*(_DWORD *)&self->_flags & 0x20) != 0)
  {
LABEL_28:
    *(unsigned char *)(v5 + 113) = self->_isOrgQueryPrefixOfRefinement;
    *(_DWORD *)(v5 + 116) |= 0x20u;
  }
LABEL_29:
  uint64_t v26 = [(NSString *)self->_originalQueryDisplayString copyWithZone:a3];
  long long v27 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v26;

  uint64_t v28 = [(NSString *)self->_synonymQueryDisplayString copyWithZone:a3];
  long long v29 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v28;

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v8 = self->_featureMaps;
  uint64_t v30 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v35 objects:v47 count:16];
  if (v30)
  {
    uint64_t v31 = *(void *)v36;
    do
    {
      for (uint64_t k = 0; k != v30; ++k)
      {
        if (*(void *)v36 != v31) {
          objc_enumerationMutation(v8);
        }
        uint64_t v33 = objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * k), "copyWithZone:", a3, (void)v35);
        -[GEOPDSearchQuerySynonymMetadata addFeatureMap:](v5, v33);
      }
      uint64_t v30 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v35 objects:v47 count:16];
    }
    while (v30);
  }
LABEL_36:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_70;
  }
  -[GEOPDSearchQuerySynonymMetadata readAll:]((uint64_t)self, 1);
  -[GEOPDSearchQuerySynonymMetadata readAll:]((uint64_t)v4, 1);
  int v5 = *((_DWORD *)v4 + 29);
  if (*(unsigned char *)&self->_flags)
  {
    if ((v5 & 1) == 0 || self->_identifier != *((void *)v4 + 5)) {
      goto LABEL_70;
    }
  }
  else if (v5)
  {
    goto LABEL_70;
  }
  key = self->_key;
  if ((unint64_t)key | *((void *)v4 + 6) && !-[NSString isEqual:](key, "isEqual:")) {
    goto LABEL_70;
  }
  refinementQueries = self->_refinementQueries;
  if ((unint64_t)refinementQueries | *((void *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](refinementQueries, "isEqual:")) {
      goto LABEL_70;
    }
  }
  language = self->_language;
  if ((unint64_t)language | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](language, "isEqual:")) {
      goto LABEL_70;
    }
  }
  countryCode = self->_countryCode;
  if ((unint64_t)countryCode | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](countryCode, "isEqual:")) {
      goto LABEL_70;
    }
  }
  geoHashes = self->_geoHashes;
  if ((unint64_t)geoHashes | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](geoHashes, "isEqual:")) {
      goto LABEL_70;
    }
  }
  $B96048FCA3CE9983CCDE492874E6FFA2 flags = self->_flags;
  int v12 = *((_DWORD *)v4 + 29);
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    if ((v12 & 2) == 0 || self->_confidence != *((float *)v4 + 25)) {
      goto LABEL_70;
    }
  }
  else if ((v12 & 2) != 0)
  {
    goto LABEL_70;
  }
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    if ((v12 & 8) == 0 || self->_rewriteProvider != *((_DWORD *)v4 + 27)) {
      goto LABEL_70;
    }
  }
  else if ((v12 & 8) != 0)
  {
    goto LABEL_70;
  }
  if ((*(unsigned char *)&flags & 0x80) != 0)
  {
    if ((v12 & 0x80) == 0) {
      goto LABEL_70;
    }
    if (self->_useGeoHashes)
    {
      if (!*((unsigned char *)v4 + 115)) {
        goto LABEL_70;
      }
    }
    else if (*((unsigned char *)v4 + 115))
    {
      goto LABEL_70;
    }
  }
  else if ((v12 & 0x80) != 0)
  {
    goto LABEL_70;
  }
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    if ((v12 & 0x10) == 0) {
      goto LABEL_70;
    }
    if (self->_hardRewrite)
    {
      if (!*((unsigned char *)v4 + 112)) {
        goto LABEL_70;
      }
    }
    else if (*((unsigned char *)v4 + 112))
    {
      goto LABEL_70;
    }
  }
  else if ((v12 & 0x10) != 0)
  {
    goto LABEL_70;
  }
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    if ((v12 & 4) == 0 || self->_originalProvider != *((_DWORD *)v4 + 26)) {
      goto LABEL_70;
    }
  }
  else if ((v12 & 4) != 0)
  {
    goto LABEL_70;
  }
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
    if ((v12 & 0x40) == 0) {
      goto LABEL_70;
    }
    if (self->_isWeakLexicalMatch)
    {
      if (!*((unsigned char *)v4 + 114)) {
        goto LABEL_70;
      }
    }
    else if (*((unsigned char *)v4 + 114))
    {
      goto LABEL_70;
    }
  }
  else if ((v12 & 0x40) != 0)
  {
    goto LABEL_70;
  }
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    if ((v12 & 0x20) != 0)
    {
      if (self->_isOrgQueryPrefixOfRefinement)
      {
        if (!*((unsigned char *)v4 + 113)) {
          goto LABEL_70;
        }
        goto LABEL_64;
      }
      if (!*((unsigned char *)v4 + 113)) {
        goto LABEL_64;
      }
    }
LABEL_70:
    char v16 = 0;
    goto LABEL_71;
  }
  if ((v12 & 0x20) != 0) {
    goto LABEL_70;
  }
LABEL_64:
  originalQueryDisplayString = self->_originalQueryDisplayString;
  if ((unint64_t)originalQueryDisplayString | *((void *)v4 + 8)
    && !-[NSString isEqual:](originalQueryDisplayString, "isEqual:"))
  {
    goto LABEL_70;
  }
  synonymQueryDisplayString = self->_synonymQueryDisplayString;
  if ((unint64_t)synonymQueryDisplayString | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](synonymQueryDisplayString, "isEqual:")) {
      goto LABEL_70;
    }
  }
  featureMaps = self->_featureMaps;
  if ((unint64_t)featureMaps | *((void *)v4 + 3)) {
    char v16 = -[NSMutableArray isEqual:](featureMaps, "isEqual:");
  }
  else {
    char v16 = 1;
  }
LABEL_71:

  return v16;
}

- (unint64_t)hash
{
  -[GEOPDSearchQuerySynonymMetadata readAll:]((uint64_t)self, 1);
  if (*(unsigned char *)&self->_flags) {
    unint64_t v3 = 2654435761u * self->_identifier;
  }
  else {
    unint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_key hash];
  uint64_t v5 = [(NSMutableArray *)self->_refinementQueries hash];
  NSUInteger v6 = [(NSString *)self->_language hash];
  NSUInteger v7 = [(NSString *)self->_countryCode hash];
  uint64_t v8 = [(NSMutableArray *)self->_geoHashes hash];
  $B96048FCA3CE9983CCDE492874E6FFA2 flags = self->_flags;
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    float confidence = self->_confidence;
    double v12 = confidence;
    if (confidence < 0.0) {
      double v12 = -confidence;
    }
    long double v13 = floor(v12 + 0.5);
    double v14 = (v12 - v13) * 1.84467441e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v10 += (unint64_t)v14;
      }
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    uint64_t v15 = 2654435761 * self->_rewriteProvider;
    if ((*(unsigned char *)&flags & 0x80) != 0)
    {
LABEL_14:
      uint64_t v16 = 2654435761 * self->_useGeoHashes;
      if ((*(unsigned char *)&flags & 0x10) != 0) {
        goto LABEL_15;
      }
      goto LABEL_21;
    }
  }
  else
  {
    uint64_t v15 = 0;
    if ((*(unsigned char *)&flags & 0x80) != 0) {
      goto LABEL_14;
    }
  }
  uint64_t v16 = 0;
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
LABEL_15:
    uint64_t v17 = 2654435761 * self->_hardRewrite;
    if ((*(unsigned char *)&flags & 4) != 0) {
      goto LABEL_16;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v17 = 0;
  if ((*(unsigned char *)&flags & 4) != 0)
  {
LABEL_16:
    uint64_t v18 = 2654435761 * self->_originalProvider;
    if ((*(unsigned char *)&flags & 0x40) != 0) {
      goto LABEL_17;
    }
LABEL_23:
    uint64_t v19 = 0;
    if ((*(unsigned char *)&flags & 0x20) != 0) {
      goto LABEL_18;
    }
LABEL_24:
    uint64_t v20 = 0;
    goto LABEL_25;
  }
LABEL_22:
  uint64_t v18 = 0;
  if ((*(unsigned char *)&flags & 0x40) == 0) {
    goto LABEL_23;
  }
LABEL_17:
  uint64_t v19 = 2654435761 * self->_isWeakLexicalMatch;
  if ((*(unsigned char *)&flags & 0x20) == 0) {
    goto LABEL_24;
  }
LABEL_18:
  uint64_t v20 = 2654435761 * self->_isOrgQueryPrefixOfRefinement;
LABEL_25:
  NSUInteger v21 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10;
  NSUInteger v22 = v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ [(NSString *)self->_originalQueryDisplayString hash];
  NSUInteger v23 = v22 ^ [(NSString *)self->_synonymQueryDisplayString hash];
  return v21 ^ v23 ^ [(NSMutableArray *)self->_featureMaps hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synonymQueryDisplayString, 0);
  objc_storeStrong((id *)&self->_refinementQueries, 0);
  objc_storeStrong((id *)&self->_originalQueryDisplayString, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_geoHashes, 0);
  objc_storeStrong((id *)&self->_featureMaps, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end