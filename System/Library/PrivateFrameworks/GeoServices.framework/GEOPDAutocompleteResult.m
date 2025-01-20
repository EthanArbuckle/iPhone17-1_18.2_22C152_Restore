@interface GEOPDAutocompleteResult
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDAutocompleteResult)init;
- (GEOPDAutocompleteResult)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)autocompleteSessionData;
- (id)clientRankingFeatureMetadatas;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)placeSummaryLayoutMetadata;
- (id)sections;
- (id)sortPriorityMappings;
- (os_unfair_lock_s)highlightType;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (unint64_t)hash;
- (void)_addNoFlagsClientRankingFeatureMetadata:(uint64_t)a1;
- (void)_addNoFlagsSections:(uint64_t)a1;
- (void)_addNoFlagsSortPriorityMapping:(uint64_t)a1;
- (void)_readAutocompleteSessionData;
- (void)_readClientRankingFeatureMetadatas;
- (void)_readPlaceSummaryLayoutMetadata;
- (void)_readSections;
- (void)_readSortPriorityMappings;
- (void)addClientRankingFeatureMetadata:(os_unfair_lock_s *)a1;
- (void)addSections:(os_unfair_lock_s *)a1;
- (void)addSortPriorityMapping:(os_unfair_lock_s *)a1;
- (void)readAll:(uint64_t)a1;
- (void)setAutocompleteSessionData:(uint64_t)a1;
- (void)setParsecQueryRankingFeatures:(uint64_t)a1;
- (void)setPlaceSummaryLayoutMetadata:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDAutocompleteResult

- (GEOPDAutocompleteResult)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDAutocompleteResult;
  v2 = [(GEOPDAutocompleteResult *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDAutocompleteResult)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDAutocompleteResult;
  v3 = [(GEOPDAutocompleteResult *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readSections
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 106) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSections_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)sections
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDAutocompleteResult _readSections]((uint64_t)a1);
    a1 = (id *)v2[7];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addSections:(os_unfair_lock_s *)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDAutocompleteResult _readSections]((uint64_t)a1);
    -[GEOPDAutocompleteResult _addNoFlagsSections:]((uint64_t)a1, v3);

    os_unfair_lock_lock_with_options();
    a1[26]._os_unfair_lock_opaque |= 0x10000u;
    os_unfair_lock_unlock(a1 + 20);
    a1[26]._os_unfair_lock_opaque |= 0x40000u;
  }
}

- (void)_addNoFlagsSections:(uint64_t)a1
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

- (void)_readSortPriorityMappings
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 106) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSortPriorityMappings_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)sortPriorityMappings
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDAutocompleteResult _readSortPriorityMappings]((uint64_t)a1);
    a1 = (id *)v2[8];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addSortPriorityMapping:(os_unfair_lock_s *)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDAutocompleteResult _readSortPriorityMappings]((uint64_t)a1);
    -[GEOPDAutocompleteResult _addNoFlagsSortPriorityMapping:]((uint64_t)a1, v3);

    os_unfair_lock_lock_with_options();
    a1[26]._os_unfair_lock_opaque |= 0x20000u;
    os_unfair_lock_unlock(a1 + 20);
    a1[26]._os_unfair_lock_opaque |= 0x40000u;
  }
}

- (void)_addNoFlagsSortPriorityMapping:(uint64_t)a1
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

- (void)_readClientRankingFeatureMetadatas
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 105) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readClientRankingFeatureMetadatas_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)clientRankingFeatureMetadatas
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDAutocompleteResult _readClientRankingFeatureMetadatas]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addClientRankingFeatureMetadata:(os_unfair_lock_s *)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDAutocompleteResult _readClientRankingFeatureMetadatas]((uint64_t)a1);
    -[GEOPDAutocompleteResult _addNoFlagsClientRankingFeatureMetadata:]((uint64_t)a1, v3);

    os_unfair_lock_lock_with_options();
    a1[26]._os_unfair_lock_opaque |= 0x2000u;
    os_unfair_lock_unlock(a1 + 20);
    a1[26]._os_unfair_lock_opaque |= 0x40000u;
  }
}

- (void)_addNoFlagsClientRankingFeatureMetadata:(uint64_t)a1
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

- (void)_readAutocompleteSessionData
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 105) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAutocompleteSessionData_tags_1529);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)autocompleteSessionData
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDAutocompleteResult _readAutocompleteSessionData]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setAutocompleteSessionData:(uint64_t)a1
{
  id v4 = a2;
  *(_DWORD *)(a1 + 104) |= 0x1000u;
  *(_DWORD *)(a1 + 104) |= 0x40000u;
  objc_storeStrong((id *)(a1 + 24), a2);
}

- (void)setParsecQueryRankingFeatures:(uint64_t)a1
{
  id v4 = a2;
  *(_DWORD *)(a1 + 104) |= 0x4000u;
  *(_DWORD *)(a1 + 104) |= 0x40000u;
  objc_storeStrong((id *)(a1 + 40), a2);
}

- (void)_readPlaceSummaryLayoutMetadata
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 105) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceSummaryLayoutMetadata_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)placeSummaryLayoutMetadata
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDAutocompleteResult _readPlaceSummaryLayoutMetadata]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setPlaceSummaryLayoutMetadata:(uint64_t)a1
{
  id v4 = a2;
  *(_DWORD *)(a1 + 104) |= 0x8000u;
  *(_DWORD *)(a1 + 104) |= 0x40000u;
  objc_storeStrong((id *)(a1 + 48), a2);
}

- (os_unfair_lock_s)highlightType
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    uint32_t os_unfair_lock_opaque = v1[26]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v1 + 20);
    if ((os_unfair_lock_opaque & 2) != 0) {
      return (os_unfair_lock_s *)v1[22]._os_unfair_lock_opaque;
    }
    else {
      return 0;
    }
  }
  return result;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDAutocompleteResult;
  id v4 = [(GEOPDAutocompleteResult *)&v8 description];
  id v5 = [(GEOPDAutocompleteResult *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAutocompleteResult _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDAutocompleteResult readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 56) count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
      long long v85 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      id v6 = *(id *)(a1 + 56);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v85 objects:v91 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v86;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v86 != v8) {
              objc_enumerationMutation(v6);
            }
            v10 = *(void **)(*((void *)&v85 + 1) + 8 * i);
            if (a2) {
              [v10 jsonRepresentation];
            }
            else {
            v11 = [v10 dictionaryRepresentation];
            }
            [v5 addObject:v11];
          }
          uint64_t v7 = [v6 countByEnumeratingWithState:&v85 objects:v91 count:16];
        }
        while (v7);
      }

      [v4 setObject:v5 forKey:@"sections"];
    }
    int v12 = *(_DWORD *)(a1 + 104);
    if ((v12 & 8) != 0)
    {
      v13 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 96)];
      if (a2) {
        v14 = @"enableRap";
      }
      else {
        v14 = @"enable_rap";
      }
      [v4 setObject:v13 forKey:v14];

      int v12 = *(_DWORD *)(a1 + 104);
    }
    if ((v12 & 0x100) != 0)
    {
      v15 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 101)];
      if (a2) {
        v16 = @"shouldDisplayNoResults";
      }
      else {
        v16 = @"should_display_no_results";
      }
      [v4 setObject:v15 forKey:v16];

      int v12 = *(_DWORD *)(a1 + 104);
    }
    if ((v12 & 4) != 0)
    {
      v17 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 92)];
      if (a2) {
        v18 = @"retainSearchTime";
      }
      else {
        v18 = @"retain_search_time";
      }
      [v4 setObject:v17 forKey:v18];

      int v12 = *(_DWORD *)(a1 + 104);
    }
    if ((v12 & 0x20) != 0)
    {
      v19 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 98)];
      if (a2) {
        v20 = @"isNoResultFromNegativeCache";
      }
      else {
        v20 = @"is_no_result_from_negative_cache";
      }
      [v4 setObject:v19 forKey:v20];
    }
    if ([*(id *)(a1 + 64) count])
    {
      v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
      long long v83 = 0u;
      long long v84 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      id v22 = *(id *)(a1 + 64);
      uint64_t v23 = [v22 countByEnumeratingWithState:&v81 objects:v90 count:16];
      if (v23)
      {
        uint64_t v24 = *(void *)v82;
        do
        {
          for (uint64_t j = 0; j != v23; ++j)
          {
            if (*(void *)v82 != v24) {
              objc_enumerationMutation(v22);
            }
            v26 = *(void **)(*((void *)&v81 + 1) + 8 * j);
            if (a2) {
              [v26 jsonRepresentation];
            }
            else {
            v27 = [v26 dictionaryRepresentation];
            }
            [v21 addObject:v27];
          }
          uint64_t v23 = [v22 countByEnumeratingWithState:&v81 objects:v90 count:16];
        }
        while (v23);
      }

      if (a2) {
        v28 = @"sortPriorityMapping";
      }
      else {
        v28 = @"sort_priority_mapping";
      }
      [v4 setObject:v21 forKey:v28];
    }
    if ((*(unsigned char *)(a1 + 104) & 0x40) != 0)
    {
      v29 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 99)];
      if (a2) {
        v30 = @"isTopSectionTypeQuery";
      }
      else {
        v30 = @"is_top_section_type_query";
      }
      [v4 setObject:v29 forKey:v30];
    }
    if ([*(id *)(a1 + 32) count])
    {
      v31 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v79 = 0u;
      long long v80 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      id v32 = *(id *)(a1 + 32);
      uint64_t v33 = [v32 countByEnumeratingWithState:&v77 objects:v89 count:16];
      if (v33)
      {
        uint64_t v34 = *(void *)v78;
        do
        {
          for (uint64_t k = 0; k != v33; ++k)
          {
            if (*(void *)v78 != v34) {
              objc_enumerationMutation(v32);
            }
            v36 = *(void **)(*((void *)&v77 + 1) + 8 * k);
            if (a2) {
              [v36 jsonRepresentation];
            }
            else {
            v37 = [v36 dictionaryRepresentation];
            }
            [v31 addObject:v37];
          }
          uint64_t v33 = [v32 countByEnumeratingWithState:&v77 objects:v89 count:16];
        }
        while (v33);
      }

      if (a2) {
        v38 = @"clientRankingFeatureMetadata";
      }
      else {
        v38 = @"client_ranking_feature_metadata";
      }
      [v4 setObject:v31 forKey:v38];
    }
    if ((*(unsigned char *)(a1 + 104) & 0x80) != 0)
    {
      v39 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 100)];
      if (a2) {
        v40 = @"shouldDifferentiateClientAndServerResults";
      }
      else {
        v40 = @"should_differentiate_client_and_server_results";
      }
      [v4 setObject:v39 forKey:v40];
    }
    v41 = -[GEOPDAutocompleteResult autocompleteSessionData]((id *)a1);
    v42 = v41;
    if (v41)
    {
      if (a2)
      {
        v43 = [v41 jsonRepresentation];
        v44 = @"autocompleteSessionData";
      }
      else
      {
        v43 = [v41 dictionaryRepresentation];
        v44 = @"autocomplete_session_data";
      }
      [v4 setObject:v43 forKey:v44];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 105) & 0x40) == 0)
    {
      v45 = *(void **)(a1 + 8);
      if (v45)
      {
        id v46 = v45;
        objc_sync_enter(v46);
        GEOPDAutocompleteResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readParsecQueryRankingFeatures_tags);
        objc_sync_exit(v46);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    id v47 = *(id *)(a1 + 40);
    v48 = v47;
    if (v47)
    {
      if (a2)
      {
        v49 = [v47 jsonRepresentation];
        v50 = @"parsecQueryRankingFeatures";
      }
      else
      {
        v49 = [v47 dictionaryRepresentation];
        v50 = @"parsec_query_ranking_features";
      }
      [v4 setObject:v49 forKey:v50];
    }
    if ((*(unsigned char *)(a1 + 105) & 2) != 0)
    {
      v51 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 102)];
      if (a2) {
        v52 = @"shouldEnableGrayscaleHighlighting";
      }
      else {
        v52 = @"should_enable_grayscale_highlighting";
      }
      [v4 setObject:v51 forKey:v52];
    }
    v53 = -[GEOPDAutocompleteResult placeSummaryLayoutMetadata]((id *)a1);
    v54 = v53;
    if (v53)
    {
      if (a2)
      {
        v55 = [v53 jsonRepresentation];
        v56 = @"placeSummaryLayoutMetadata";
      }
      else
      {
        v55 = [v53 dictionaryRepresentation];
        v56 = @"place_summary_layout_metadata";
      }
      [v4 setObject:v55 forKey:v56];
    }
    int v57 = *(_DWORD *)(a1 + 104);
    if ((v57 & 0x400) != 0)
    {
      v58 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 103)];
      if (a2) {
        v59 = @"shouldUseDistanceFeatureServerResults";
      }
      else {
        v59 = @"should_use_distance_feature_server_results";
      }
      [v4 setObject:v58 forKey:v59];

      int v57 = *(_DWORD *)(a1 + 104);
    }
    if (v57)
    {
      uint64_t v60 = *(int *)(a1 + 84);
      if (v60 >= 7)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 84));
        v61 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v61 = off_1E53DC710[v60];
      }
      if (a2) {
        v62 = @"clientResolvedTypeSetupPrompt";
      }
      else {
        v62 = @"client_resolved_type_setup_prompt";
      }
      [v4 setObject:v61 forKey:v62];

      int v57 = *(_DWORD *)(a1 + 104);
    }
    if ((v57 & 2) != 0)
    {
      uint64_t v63 = *(int *)(a1 + 88);
      if (v63 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 88));
        v64 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v64 = off_1E53DC748[v63];
      }
      if (a2) {
        v65 = @"highlightType";
      }
      else {
        v65 = @"highlight_type";
      }
      [v4 setObject:v64 forKey:v65];

      int v57 = *(_DWORD *)(a1 + 104);
    }
    if ((v57 & 0x10) != 0)
    {
      v66 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 97)];
      if (a2) {
        v67 = @"enableStructuredRapAffordance";
      }
      else {
        v67 = @"enable_structured_rap_affordance";
      }
      [v4 setObject:v66 forKey:v67];
    }
    v68 = *(void **)(a1 + 16);
    if (v68)
    {
      v69 = [v68 dictionaryRepresentation];
      v70 = v69;
      if (a2)
      {
        v71 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v69, "count"));
        v75[0] = MEMORY[0x1E4F143A8];
        v75[1] = 3221225472;
        v75[2] = __53__GEOPDAutocompleteResult__dictionaryRepresentation___block_invoke;
        v75[3] = &unk_1E53D8860;
        id v72 = v71;
        id v76 = v72;
        [v70 enumerateKeysAndObjectsUsingBlock:v75];
        id v73 = v72;
      }
      else
      {
        id v73 = v69;
      }
      [v4 setObject:v73 forKey:@"Unknown Fields"];
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
  return -[GEOPDAutocompleteResult _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_1625;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_1626;
      }
      GEOPDAutocompleteResultReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDAutocompleteResultCallReadAllRecursiveWithoutSynchronized((id *)a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

void __53__GEOPDAutocompleteResult__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void **)(a1 + 32);
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

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v212 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  uint64_t v173 = [a1 init];
  if (!v173) {
    goto LABEL_473;
  }
  v152 = v4;
  v151 = [v4 objectForKeyedSubscript:@"sections"];
  objc_opt_class();
  id v5 = v151;
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_226;
  }
  long long v187 = 0u;
  long long v188 = 0u;
  long long v185 = 0u;
  long long v186 = 0u;
  obuint64_t j = v151;
  uint64_t v165 = [obj countByEnumeratingWithState:&v185 objects:v207 count:16];
  if (!v165) {
    goto LABEL_225;
  }
  id v6 = @"suggestion_type";
  uint64_t v164 = *(void *)v186;
  if (a3) {
    id v6 = @"suggestionType";
  }
  v162 = v6;
  uint64_t v7 = @"num_visible_results";
  if (a3) {
    uint64_t v7 = @"numVisibleResults";
  }
  v161 = v7;
  if (a3) {
    uint64_t v8 = @"shouldInterleaveClientResults";
  }
  else {
    uint64_t v8 = @"should_interleave_client_results";
  }
  v160 = v8;
  if (a3) {
    v9 = @"enforceServerResultsOrder";
  }
  else {
    v9 = @"enforce_server_results_order";
  }
  id v10 = @"enable_maps_suggest_server_reranking";
  if (a3) {
    id v10 = @"enableMapsSuggestServerReranking";
  }
  v158 = v10;
  v159 = v9;
  if (a3) {
    v11 = @"contentType";
  }
  else {
    v11 = @"content_type";
  }
  int v12 = @"isSectionForClientOnlyResults";
  if (!a3) {
    int v12 = @"is_section_for_client_only_results";
  }
  v156 = v12;
  v157 = v11;
  v13 = @"allowed_type_client_only_section";
  if (a3) {
    v13 = @"allowedTypeClientOnlySection";
  }
  v155 = v13;
  if (a3) {
    v14 = @"includedClientResultType";
  }
  else {
    v14 = @"included_client_result_type";
  }
  v154 = v14;
  v15 = @"excluded_client_result_type";
  if (a3) {
    v15 = @"excludedClientResultType";
  }
  v153 = v15;
  do
  {
    uint64_t v16 = 0;
    do
    {
      if (*(void *)v186 != v164)
      {
        uint64_t v17 = v16;
        objc_enumerationMutation(obj);
        uint64_t v16 = v17;
      }
      uint64_t v171 = v16;
      v18 = *(void **)(*((void *)&v185 + 1) + 8 * v16);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_223;
      }
      v19 = [GEOPDAutocompleteResultSection alloc];
      if (!v19) {
        goto LABEL_222;
      }
      id v174 = v18;
      v19 = [(GEOPDAutocompleteResultSection *)v19 init];

      if (!v19) {
        goto LABEL_221;
      }
      v20 = [v174 objectForKeyedSubscript:@"type"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v21 = v20;
        if ([v21 isEqualToString:@"QUERY"])
        {
          int v22 = 0;
        }
        else if ([v21 isEqualToString:@"BUSINESS"])
        {
          int v22 = 1;
        }
        else if ([v21 isEqualToString:@"ADDRESS"])
        {
          int v22 = 2;
        }
        else if ([v21 isEqualToString:@"CATEGORY"])
        {
          int v22 = 3;
        }
        else if ([v21 isEqualToString:@"BRAND_PROFILE"])
        {
          int v22 = 4;
        }
        else if ([v21 isEqualToString:@"OFFLINE_AREA"])
        {
          int v22 = 5;
        }
        else if ([v21 isEqualToString:@"CLIENT_RESOLVED"])
        {
          int v22 = 6;
        }
        else if ([v21 isEqualToString:@"DIRECTION_INTENT"])
        {
          int v22 = 7;
        }
        else if ([v21 isEqualToString:@"COLLECTION"])
        {
          int v22 = 8;
        }
        else if ([v21 isEqualToString:@"PUBLISHER"])
        {
          int v22 = 9;
        }
        else
        {
          int v22 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_61;
        }
        int v22 = [v20 intValue];
      }
      *(_WORD *)&v19->_flags |= 0x4000u;
      *(_WORD *)&v19->_flags |= 8u;
      v19->_type = v22;
LABEL_61:

      uint64_t v23 = [v174 objectForKeyedSubscript:@"name"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v24 = (void *)[v23 copy];
        id v25 = v24;
        *(_WORD *)&v19->_flags |= 0x2000u;
        *(_WORD *)&v19->_flags |= 0x4000u;
        objc_storeStrong((id *)&v19->_name, v24);
      }
      v26 = [v174 objectForKeyedSubscript:@"entries"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v203 = 0u;
        long long v204 = 0u;
        long long v201 = 0u;
        long long v202 = 0u;
        id v27 = v26;
        uint64_t v28 = [v27 countByEnumeratingWithState:&v201 objects:v211 count:16];
        if (v28)
        {
          uint64_t v29 = *(void *)v202;
          do
          {
            for (uint64_t i = 0; i != v28; ++i)
            {
              if (*(void *)v202 != v29) {
                objc_enumerationMutation(v27);
              }
              uint64_t v31 = *(void *)(*((void *)&v201 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v32 = [GEOPDAutocompleteEntry alloc];
                if (a3) {
                  uint64_t v33 = [(GEOPDAutocompleteEntry *)v32 initWithJSON:v31];
                }
                else {
                  uint64_t v33 = [(GEOPDAutocompleteEntry *)v32 initWithDictionary:v31];
                }
                uint64_t v34 = v33;
                -[GEOPDAutocompleteResultSection addEntries:]((uint64_t)v19, v33);
              }
            }
            uint64_t v28 = [v27 countByEnumeratingWithState:&v201 objects:v211 count:16];
          }
          while (v28);
        }
      }
      v35 = [v174 objectForKeyedSubscript:v162];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v36 = v35;
        if ([v36 isEqualToString:@"SUGGESTION_UNKNOWN"])
        {
          int v37 = 0;
        }
        else if ([v36 isEqualToString:@"SUGGESTION_CATEGORY"])
        {
          int v37 = 1;
        }
        else if ([v36 isEqualToString:@"SUGGESTION_TRANSIT"])
        {
          int v37 = 2;
        }
        else if ([v36 isEqualToString:@"SUGGESTION_CHAIN"])
        {
          int v37 = 3;
        }
        else if ([v36 isEqualToString:@"SUGGESTION_MIXED_INTENT"])
        {
          int v37 = 4;
        }
        else if ([v36 isEqualToString:@"SUGGESTION_MISC"])
        {
          int v37 = 5;
        }
        else if ([v36 isEqualToString:@"SUGGESTION_CLIENT_RESOLVED"])
        {
          int v37 = 6;
        }
        else if ([v36 isEqualToString:@"SUGGESTION_DIRECTION_INTENT"])
        {
          int v37 = 7;
        }
        else if ([v36 isEqualToString:@"SUGGESTION_COLLECTION"])
        {
          int v37 = 8;
        }
        else if ([v36 isEqualToString:@"SUGGESTION_PUBLISHER"])
        {
          int v37 = 9;
        }
        else
        {
          int v37 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_103;
        }
        int v37 = [v35 intValue];
      }
      *(_WORD *)&v19->_flags |= 0x4000u;
      *(_WORD *)&v19->_flags |= 4u;
      v19->_suggestionType = v37;
LABEL_103:

      v38 = [v174 objectForKeyedSubscript:v161];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v39 = [v38 intValue];
        *(_WORD *)&v19->_flags |= 0x4000u;
        *(_WORD *)&v19->_flags |= 2u;
        v19->_numVisibleResults = v39;
      }

      v40 = [v174 objectForKeyedSubscript:v160];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        char v41 = [v40 BOOLValue];
        *(_WORD *)&v19->_flags |= 0x4000u;
        *(_WORD *)&v19->_flags |= 0x80u;
        v19->_shouldInterleaveClientResults = v41;
      }

      v42 = [v174 objectForKeyedSubscript:v159];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        char v43 = [v42 BOOLValue];
        *(_WORD *)&v19->_flags |= 0x4000u;
        *(_WORD *)&v19->_flags |= 0x20u;
        v19->_enforceServerResultsOrder = v43;
      }

      v44 = [v174 objectForKeyedSubscript:v158];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        char v45 = [v44 BOOLValue];
        *(_WORD *)&v19->_flags |= 0x4000u;
        *(_WORD *)&v19->_flags |= 0x10u;
        v19->_enableMapsSuggestServerReranking = v45;
      }

      id v46 = [v174 objectForKeyedSubscript:v157];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v47 = v46;
        if ([v47 isEqualToString:@"AUTOCOMPLETE_SECTION_CONTENT_TYPE_UNKNOWN"])
        {
          int v48 = 0;
        }
        else if ([v47 isEqualToString:@"AUTOCOMPLETE_SECTION_CONTENT_TYPE_PRIMARY"])
        {
          int v48 = 1;
        }
        else if ([v47 isEqualToString:@"AUTOCOMPLETE_SECTION_CONTENT_TYPE_RELATED_RESULTS"])
        {
          int v48 = 2;
        }
        else if ([v47 isEqualToString:@"AUTOCOMPLETE_SECTION_CONTENT_TYPE_PARTIAL_MATCHES"])
        {
          int v48 = 3;
        }
        else
        {
          int v48 = 0;
        }

        goto LABEL_124;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v48 = [v46 intValue];
LABEL_124:
        *(_WORD *)&v19->_flags |= 0x4000u;
        *(_WORD *)&v19->_flags |= 1u;
        v19->_contentType = v48;
      }

      v49 = [v174 objectForKeyedSubscript:v156];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        char v50 = [v49 BOOLValue];
        *(_WORD *)&v19->_flags |= 0x4000u;
        *(_WORD *)&v19->_flags |= 0x40u;
        v19->_isSectionForClientOnlyResults = v50;
      }

      v167 = [v174 objectForKeyedSubscript:v155];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v199 = 0u;
        long long v200 = 0u;
        long long v197 = 0u;
        long long v198 = 0u;
        id v51 = v167;
        uint64_t v52 = [v51 countByEnumeratingWithState:&v197 objects:v210 count:16];
        if (!v52) {
          goto LABEL_159;
        }
        uint64_t v53 = *(void *)v198;
        while (1)
        {
          for (uint64_t j = 0; j != v52; ++j)
          {
            if (*(void *)v198 != v53) {
              objc_enumerationMutation(v51);
            }
            v55 = *(void **)(*((void *)&v197 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v56 = v55;
              if (([v56 isEqualToString:@"AC_TYPE_UNKNOWN"] & 1) == 0
                && ([v56 isEqualToString:@"AC_TYPE_CLIENT_COREROUTINE"] & 1) == 0
                && ([v56 isEqualToString:@"AC_TYPE_CLIENT_CORERECENT_MESSAGES"] & 1) == 0
                && ([v56 isEqualToString:@"AC_TYPE_CLIENT_CORERECENT_MAIL"] & 1) == 0
                && ([v56 isEqualToString:@"AC_TYPE_CLIENT_MAPSRECENT_QUERY"] & 1) == 0
                && ([v56 isEqualToString:@"AC_TYPE_CLIENT_MAPSRECENT_DIRECTIONS"] & 1) == 0
                && ([v56 isEqualToString:@"AC_TYPE_CLIENT_MAPSRECENT_PLACE"] & 1) == 0
                && ([v56 isEqualToString:@"AC_TYPE_CLIENT_CONTACTS"] & 1) == 0
                && ([v56 isEqualToString:@"AC_TYPE_CLIENT_FAVORITE"] & 1) == 0
                && ([v56 isEqualToString:@"AC_TYPE_SERVER"] & 1) == 0
                && ([v56 isEqualToString:@"AC_TYPE_CLIENT"] & 1) == 0
                && ([v56 isEqualToString:@"AC_TYPE_CLIENT_USER_LOCATION"] & 1) == 0
                && ([v56 isEqualToString:@"AC_TYPE_CLIENT_PARKED_CAR"] & 1) == 0
                && ([v56 isEqualToString:@"AC_TYPE_CLIENT_MARKED_LOCATION"] & 1) == 0)
              {
                [v56 isEqualToString:@"AC_TYPE_CLIENT_PROACTIVE"];
              }
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                continue;
              }
              [v55 intValue];
            }
            os_unfair_lock_lock(&v19->_readerLock);
            if ((*(_WORD *)&v19->_flags & 0x200) == 0)
            {
              reader = v19->_reader;
              if (reader)
              {
                v58 = reader;
                objc_sync_enter(v58);
                GEOPDAutocompleteResultSectionReadSpecified((uint64_t)v19, (unint64_t)v19->_reader, (int *)&_readAllowedTypeClientOnlySections_tags);
                objc_sync_exit(v58);
              }
            }
            os_unfair_lock_unlock(&v19->_readerLock);
            PBRepeatedInt32Add();
            os_unfair_lock_lock_with_options();
            *(_WORD *)&v19->_flags |= 0x200u;
            os_unfair_lock_unlock(&v19->_readerLock);
            *(_WORD *)&v19->_flags |= 0x4000u;
          }
          uint64_t v52 = [v51 countByEnumeratingWithState:&v197 objects:v210 count:16];
          if (!v52)
          {
LABEL_159:

            break;
          }
        }
      }

      v168 = [v174 objectForKeyedSubscript:v154];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_190;
      }
      long long v195 = 0u;
      long long v196 = 0u;
      long long v193 = 0u;
      long long v194 = 0u;
      id v59 = v168;
      uint64_t v60 = [v59 countByEnumeratingWithState:&v193 objects:v209 count:16];
      if (!v60) {
        goto LABEL_189;
      }
      uint64_t v61 = *(void *)v194;
      do
      {
        for (uint64_t k = 0; k != v60; ++k)
        {
          if (*(void *)v194 != v61) {
            objc_enumerationMutation(v59);
          }
          uint64_t v63 = *(void **)(*((void *)&v193 + 1) + 8 * k);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v64 = v63;
            if (([v64 isEqualToString:@"AC_TYPE_UNKNOWN"] & 1) == 0
              && ([v64 isEqualToString:@"AC_TYPE_CLIENT_COREROUTINE"] & 1) == 0
              && ([v64 isEqualToString:@"AC_TYPE_CLIENT_CORERECENT_MESSAGES"] & 1) == 0
              && ([v64 isEqualToString:@"AC_TYPE_CLIENT_CORERECENT_MAIL"] & 1) == 0
              && ([v64 isEqualToString:@"AC_TYPE_CLIENT_MAPSRECENT_QUERY"] & 1) == 0
              && ([v64 isEqualToString:@"AC_TYPE_CLIENT_MAPSRECENT_DIRECTIONS"] & 1) == 0
              && ([v64 isEqualToString:@"AC_TYPE_CLIENT_MAPSRECENT_PLACE"] & 1) == 0
              && ([v64 isEqualToString:@"AC_TYPE_CLIENT_CONTACTS"] & 1) == 0
              && ([v64 isEqualToString:@"AC_TYPE_CLIENT_FAVORITE"] & 1) == 0
              && ([v64 isEqualToString:@"AC_TYPE_SERVER"] & 1) == 0
              && ([v64 isEqualToString:@"AC_TYPE_CLIENT"] & 1) == 0
              && ([v64 isEqualToString:@"AC_TYPE_CLIENT_USER_LOCATION"] & 1) == 0
              && ([v64 isEqualToString:@"AC_TYPE_CLIENT_PARKED_CAR"] & 1) == 0
              && ([v64 isEqualToString:@"AC_TYPE_CLIENT_MARKED_LOCATION"] & 1) == 0)
            {
              [v64 isEqualToString:@"AC_TYPE_CLIENT_PROACTIVE"];
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              continue;
            }
            [v63 intValue];
          }
          -[GEOPDAutocompleteResultSection _readIncludedClientResultTypes]((uint64_t)v19);
          PBRepeatedInt32Add();
          os_unfair_lock_lock_with_options();
          *(_WORD *)&v19->_flags |= 0x800u;
          os_unfair_lock_unlock(&v19->_readerLock);
          *(_WORD *)&v19->_flags |= 0x4000u;
        }
        uint64_t v60 = [v59 countByEnumeratingWithState:&v193 objects:v209 count:16];
      }
      while (v60);
LABEL_189:

LABEL_190:
      v169 = [v174 objectForKeyedSubscript:v153];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_220;
      }
      long long v191 = 0u;
      long long v192 = 0u;
      long long v189 = 0u;
      long long v190 = 0u;
      id v65 = v169;
      uint64_t v66 = [v65 countByEnumeratingWithState:&v189 objects:v208 count:16];
      if (!v66) {
        goto LABEL_219;
      }
      uint64_t v67 = *(void *)v190;
      while (2)
      {
        uint64_t v68 = 0;
        while (2)
        {
          if (*(void *)v190 != v67) {
            objc_enumerationMutation(v65);
          }
          v69 = *(void **)(*((void *)&v189 + 1) + 8 * v68);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v70 = v69;
            if (([v70 isEqualToString:@"AC_TYPE_UNKNOWN"] & 1) == 0
              && ([v70 isEqualToString:@"AC_TYPE_CLIENT_COREROUTINE"] & 1) == 0
              && ([v70 isEqualToString:@"AC_TYPE_CLIENT_CORERECENT_MESSAGES"] & 1) == 0
              && ([v70 isEqualToString:@"AC_TYPE_CLIENT_CORERECENT_MAIL"] & 1) == 0
              && ([v70 isEqualToString:@"AC_TYPE_CLIENT_MAPSRECENT_QUERY"] & 1) == 0
              && ([v70 isEqualToString:@"AC_TYPE_CLIENT_MAPSRECENT_DIRECTIONS"] & 1) == 0
              && ([v70 isEqualToString:@"AC_TYPE_CLIENT_MAPSRECENT_PLACE"] & 1) == 0
              && ([v70 isEqualToString:@"AC_TYPE_CLIENT_CONTACTS"] & 1) == 0
              && ([v70 isEqualToString:@"AC_TYPE_CLIENT_FAVORITE"] & 1) == 0
              && ([v70 isEqualToString:@"AC_TYPE_SERVER"] & 1) == 0
              && ([v70 isEqualToString:@"AC_TYPE_CLIENT"] & 1) == 0
              && ([v70 isEqualToString:@"AC_TYPE_CLIENT_USER_LOCATION"] & 1) == 0
              && ([v70 isEqualToString:@"AC_TYPE_CLIENT_PARKED_CAR"] & 1) == 0
              && ([v70 isEqualToString:@"AC_TYPE_CLIENT_MARKED_LOCATION"] & 1) == 0)
            {
              [v70 isEqualToString:@"AC_TYPE_CLIENT_PROACTIVE"];
            }

LABEL_216:
            -[GEOPDAutocompleteResultSection _readExcludedClientResultTypes]((uint64_t)v19);
            PBRepeatedInt32Add();
            os_unfair_lock_lock_with_options();
            *(_WORD *)&v19->_flags |= 0x400u;
            os_unfair_lock_unlock(&v19->_readerLock);
            *(_WORD *)&v19->_flags |= 0x4000u;
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v69 intValue];
              goto LABEL_216;
            }
          }
          if (v66 != ++v68) {
            continue;
          }
          break;
        }
        uint64_t v66 = [v65 countByEnumeratingWithState:&v189 objects:v208 count:16];
        if (v66) {
          continue;
        }
        break;
      }
LABEL_219:

LABEL_220:
LABEL_221:

LABEL_222:
      -[GEOPDAutocompleteResult addSections:]((os_unfair_lock_s *)v173, v19);

LABEL_223:
      uint64_t v16 = v171 + 1;
    }
    while (v171 + 1 != v165);
    uint64_t v165 = [obj countByEnumeratingWithState:&v185 objects:v207 count:16];
  }
  while (v165);
LABEL_225:

  id v5 = v151;
LABEL_226:

  if (a3) {
    v71 = @"enableRap";
  }
  else {
    v71 = @"enable_rap";
  }
  id v72 = objc_msgSend(v4, "objectForKeyedSubscript:", v71, v151);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v73 = [v72 BOOLValue];
    *(_DWORD *)(v173 + 104) |= 0x40000u;
    *(_DWORD *)(v173 + 104) |= 8u;
    *(unsigned char *)(v173 + 96) = v73;
  }

  if (a3) {
    v74 = @"shouldDisplayNoResults";
  }
  else {
    v74 = @"should_display_no_results";
  }
  v75 = [v4 objectForKeyedSubscript:v74];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v76 = [v75 BOOLValue];
    *(_DWORD *)(v173 + 104) |= 0x40000u;
    *(_DWORD *)(v173 + 104) |= 0x100u;
    *(unsigned char *)(v173 + 101) = v76;
  }

  if (a3) {
    long long v77 = @"retainSearchTime";
  }
  else {
    long long v77 = @"retain_search_time";
  }
  long long v78 = [v4 objectForKeyedSubscript:v77];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v79 = [v78 unsignedIntValue];
    *(_DWORD *)(v173 + 104) |= 0x40000u;
    *(_DWORD *)(v173 + 104) |= 4u;
    *(_DWORD *)(v173 + 92) = v79;
  }

  if (a3) {
    long long v80 = @"isNoResultFromNegativeCache";
  }
  else {
    long long v80 = @"is_no_result_from_negative_cache";
  }
  long long v81 = [v4 objectForKeyedSubscript:v80];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v82 = [v81 BOOLValue];
    *(_DWORD *)(v173 + 104) |= 0x40000u;
    *(_DWORD *)(v173 + 104) |= 0x20u;
    *(unsigned char *)(v173 + 98) = v82;
  }

  if (a3) {
    long long v83 = @"sortPriorityMapping";
  }
  else {
    long long v83 = @"sort_priority_mapping";
  }
  v166 = [v4 objectForKeyedSubscript:v83];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v183 = 0u;
    long long v184 = 0u;
    long long v181 = 0u;
    long long v182 = 0u;
    id v84 = v166;
    uint64_t v85 = [v84 countByEnumeratingWithState:&v181 objects:v206 count:16];
    if (!v85) {
      goto LABEL_367;
    }
    long long v86 = @"sort_priority";
    uint64_t v87 = *(void *)v182;
    if (a3) {
      long long v86 = @"sortPriority";
    }
    v175 = v86;
    if (a3) {
      long long v88 = @"resultType";
    }
    else {
      long long v88 = @"result_type";
    }
    v89 = @"result_subtype";
    if (a3) {
      v89 = @"resultSubtype";
    }
    v170 = v89;
    v172 = v88;
    while (1)
    {
      for (uint64_t m = 0; m != v85; ++m)
      {
        if (*(void *)v182 != v87) {
          objc_enumerationMutation(v84);
        }
        v91 = *(void **)(*((void *)&v181 + 1) + 8 * m);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v92 = [GEOPDAutocompleteResultSortPriorityMapping alloc];
          if (v92)
          {
            id v93 = v91;
            uint64_t v94 = [(GEOPDAutocompleteResultSortPriorityMapping *)v92 init];
            if (v94)
            {
              v95 = [v93 objectForKeyedSubscript:v175];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                int v96 = [v95 intValue];
                *(unsigned char *)(v94 + 28) |= 4u;
                *(_DWORD *)(v94 + 24) = v96;
              }

              v97 = [v93 objectForKeyedSubscript:v172];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v98 = v97;
                if ([v98 isEqualToString:@"AUTOCOMPLETE_RESULT_TYPE_UNKNOWN"])
                {
                  int v99 = 0;
                }
                else if ([v98 isEqualToString:@"AUTOCOMPLETE_RESULT_TYPE_ANY"])
                {
                  int v99 = 1;
                }
                else if ([v98 isEqualToString:@"AUTOCOMPLETE_RESULT_TYPE_SERVER"])
                {
                  int v99 = 2;
                }
                else if ([v98 isEqualToString:@"AUTOCOMPLETE_RESULT_TYPE_CALENDAR"])
                {
                  int v99 = 3;
                }
                else if ([v98 isEqualToString:@"AUTOCOMPLETE_RESULT_TYPE_COLLECTION"])
                {
                  int v99 = 4;
                }
                else if ([v98 isEqualToString:@"AUTOCOMPLETE_RESULT_TYPE_CONTACTS"])
                {
                  int v99 = 5;
                }
                else if ([v98 isEqualToString:@"AUTOCOMPLETE_RESULT_TYPE_CORE_RECENTS"])
                {
                  int v99 = 6;
                }
                else if ([v98 isEqualToString:@"AUTOCOMPLETE_RESULT_TYPE_CORE_ROUTINE"])
                {
                  int v99 = 7;
                }
                else if ([v98 isEqualToString:@"AUTOCOMPLETE_RESULT_TYPE_HISTORY"])
                {
                  int v99 = 8;
                }
                else if ([v98 isEqualToString:@"AUTOCOMPLETE_RESULT_TYPE_SIRI_SUGGESTIONS"])
                {
                  int v99 = 9;
                }
                else if ([v98 isEqualToString:@"AUTOCOMPLETE_RESULT_TYPE_SUGGESTIONS"])
                {
                  int v99 = 10;
                }
                else
                {
                  int v99 = 0;
                }

LABEL_294:
                *(unsigned char *)(v94 + 28) |= 2u;
                *(_DWORD *)(v94 + 20) = v99;
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  int v99 = [v97 intValue];
                  goto LABEL_294;
                }
              }

              v100 = [v93 objectForKeyedSubscript:v170];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v101 = v100;
                if ([v101 isEqualToString:@"AUTOCOMPLETE_RESULT_SUBTYPE_UNKNOWN"])
                {
                  int v102 = 0;
                }
                else if ([v101 isEqualToString:@"AUTOCOMPLETE_RESULT_SUBTYPE_ANY"])
                {
                  int v102 = 1;
                }
                else if ([v101 isEqualToString:@"AUTOCOMPLETE_RESULT_SUBTYPE_COLLECTION_FAVORITES"])
                {
                  int v102 = 2;
                }
                else if ([v101 isEqualToString:@"AUTOCOMPLETE_RESULT_SUBTYPE_COLLECTION_MARKED_LOCATION"])
                {
                  int v102 = 3;
                }
                else if ([v101 isEqualToString:@"AUTOCOMPLETE_RESULT_SUBTYPE_CONTACTS_ME_CARD"])
                {
                  int v102 = 4;
                }
                else if ([v101 isEqualToString:@"AUTOCOMPLETE_RESULT_SUBTYPE_CORERECENTS_MAIL"])
                {
                  int v102 = 5;
                }
                else if ([v101 isEqualToString:@"AUTOCOMPLETE_RESULT_SUBTYPE_CORERECENTS_MESSAGES"])
                {
                  int v102 = 6;
                }
                else if ([v101 isEqualToString:@"AUTOCOMPLETE_RESULT_SUBTYPE_COREROUTINE_HOME"])
                {
                  int v102 = 7;
                }
                else if ([v101 isEqualToString:@"AUTOCOMPLETE_RESULT_SUBTYPE_COREROUTINE_PARKED_CAR"])
                {
                  int v102 = 8;
                }
                else if ([v101 isEqualToString:@"AUTOCOMPLETE_RESULT_SUBTYPE_COREROUTINE_WORK"])
                {
                  int v102 = 9;
                }
                else if ([v101 isEqualToString:@"AUTOCOMPLETE_RESULT_SUBTYPE_HISTORY_DIRECTIONS"])
                {
                  int v102 = 10;
                }
                else if ([v101 isEqualToString:@"AUTOCOMPLETE_RESULT_SUBTYPE_HISTORY_PLACE"])
                {
                  int v102 = 11;
                }
                else if ([v101 isEqualToString:@"AUTOCOMPLETE_RESULT_SUBTYPE_HISTORY_QUERY"])
                {
                  int v102 = 12;
                }
                else if ([v101 isEqualToString:@"AUTOCOMPLETE_RESULT_SUBTYPE_HISTORY_TRANSIT_LINE"])
                {
                  int v102 = 13;
                }
                else if ([v101 isEqualToString:@"AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_HOME"])
                {
                  int v102 = 14;
                }
                else if ([v101 isEqualToString:@"AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_WORK"])
                {
                  int v102 = 15;
                }
                else if ([v101 isEqualToString:@"AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_CALENDAR_EVENT"])
                {
                  int v102 = 16;
                }
                else if ([v101 isEqualToString:@"AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_FREQUENT_LOCATION"])
                {
                  int v102 = 17;
                }
                else if ([v101 isEqualToString:@"AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_RECENT_HISTORY"])
                {
                  int v102 = 18;
                }
                else if ([v101 isEqualToString:@"AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_FAVORITE_PLACE"])
                {
                  int v102 = 19;
                }
                else if ([v101 isEqualToString:@"AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_PARKED_CAR"])
                {
                  int v102 = 20;
                }
                else if ([v101 isEqualToString:@"AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_RESTAURANT_RESERVATION"])
                {
                  int v102 = 21;
                }
                else if ([v101 isEqualToString:@"AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_RIDESHARING"])
                {
                  int v102 = 22;
                }
                else if ([v101 isEqualToString:@"AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_CARPLAY_LOW_ENERGY"])
                {
                  int v102 = 23;
                }
                else if ([v101 isEqualToString:@"AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_RESUME_ROUTE"])
                {
                  int v102 = 24;
                }
                else if ([v101 isEqualToString:@"AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_APP_CONNECTION"])
                {
                  int v102 = 25;
                }
                else if ([v101 isEqualToString:@"AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_HOTEL"])
                {
                  int v102 = 26;
                }
                else if ([v101 isEqualToString:@"AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_CAR_RENTAL"])
                {
                  int v102 = 27;
                }
                else if ([v101 isEqualToString:@"AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_TRAVEL_FLIGHT"])
                {
                  int v102 = 28;
                }
                else if ([v101 isEqualToString:@"AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_TICKETED_EVENT"])
                {
                  int v102 = 29;
                }
                else
                {
                  int v102 = 0;
                }

LABEL_361:
                *(unsigned char *)(v94 + 28) |= 1u;
                *(_DWORD *)(v94 + 16) = v102;
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  int v102 = [v100 intValue];
                  goto LABEL_361;
                }
              }
            }
          }
          else
          {
            uint64_t v94 = 0;
          }
          -[GEOPDAutocompleteResult addSortPriorityMapping:]((os_unfair_lock_s *)v173, (void *)v94);

          continue;
        }
      }
      uint64_t v85 = [v84 countByEnumeratingWithState:&v181 objects:v206 count:16];
      if (!v85)
      {
LABEL_367:

        break;
      }
    }
  }

  if (a3) {
    v103 = @"isTopSectionTypeQuery";
  }
  else {
    v103 = @"is_top_section_type_query";
  }
  v104 = [v152 objectForKeyedSubscript:v103];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v105 = [v104 BOOLValue];
    *(_DWORD *)(v173 + 104) |= 0x40000u;
    *(_DWORD *)(v173 + 104) |= 0x40u;
    *(unsigned char *)(v173 + 99) = v105;
  }

  if (a3) {
    v106 = @"clientRankingFeatureMetadata";
  }
  else {
    v106 = @"client_ranking_feature_metadata";
  }
  v107 = [v152 objectForKeyedSubscript:v106];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v179 = 0u;
    long long v180 = 0u;
    long long v177 = 0u;
    long long v178 = 0u;
    id v108 = v107;
    uint64_t v109 = [v108 countByEnumeratingWithState:&v177 objects:v205 count:16];
    if (v109)
    {
      uint64_t v110 = *(void *)v178;
      do
      {
        uint64_t v111 = 0;
        do
        {
          if (*(void *)v178 != v110) {
            objc_enumerationMutation(v108);
          }
          v112 = *(void **)(*((void *)&v177 + 1) + 8 * v111);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v113 = [GEOPDClientRankingFeatureMetadata alloc];
            if (v113) {
              v114 = (void *)-[GEOPDClientRankingFeatureMetadata _initWithDictionary:isJSON:](v113, v112, a3);
            }
            else {
              v114 = 0;
            }
            -[GEOPDAutocompleteResult addClientRankingFeatureMetadata:]((os_unfair_lock_s *)v173, v114);
          }
          ++v111;
        }
        while (v109 != v111);
        uint64_t v115 = [v108 countByEnumeratingWithState:&v177 objects:v205 count:16];
        uint64_t v109 = v115;
      }
      while (v115);
    }
  }
  if (a3) {
    v116 = @"shouldDifferentiateClientAndServerResults";
  }
  else {
    v116 = @"should_differentiate_client_and_server_results";
  }
  v117 = [v152 objectForKeyedSubscript:v116];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v118 = [v117 BOOLValue];
    *(_DWORD *)(v173 + 104) |= 0x40000u;
    *(_DWORD *)(v173 + 104) |= 0x80u;
    *(unsigned char *)(v173 + 100) = v118;
  }

  if (a3) {
    v119 = @"autocompleteSessionData";
  }
  else {
    v119 = @"autocomplete_session_data";
  }
  v120 = [v152 objectForKeyedSubscript:v119];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v121 = [GEOPDAutocompleteSessionData alloc];
    if (a3) {
      v122 = [(GEOPDAutocompleteSessionData *)v121 initWithJSON:v120];
    }
    else {
      v122 = [(GEOPDAutocompleteSessionData *)v121 initWithDictionary:v120];
    }
    v123 = v122;
    -[GEOPDAutocompleteResult setAutocompleteSessionData:](v173, v122);
  }
  if (a3) {
    v124 = @"parsecQueryRankingFeatures";
  }
  else {
    v124 = @"parsec_query_ranking_features";
  }
  v125 = [v152 objectForKeyedSubscript:v124];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v126 = [GEOPDParsecQueryRankingFeatures alloc];
    if (v126) {
      v127 = (void *)-[GEOPDParsecQueryRankingFeatures _initWithDictionary:isJSON:]((uint64_t)v126, v125, a3);
    }
    else {
      v127 = 0;
    }
    -[GEOPDAutocompleteResult setParsecQueryRankingFeatures:](v173, v127);
  }
  if (a3) {
    v128 = @"shouldEnableGrayscaleHighlighting";
  }
  else {
    v128 = @"should_enable_grayscale_highlighting";
  }
  v129 = [v152 objectForKeyedSubscript:v128];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v130 = [v129 BOOLValue];
    *(_DWORD *)(v173 + 104) |= 0x40000u;
    *(_DWORD *)(v173 + 104) |= 0x200u;
    *(unsigned char *)(v173 + 102) = v130;
  }

  if (a3) {
    v131 = @"placeSummaryLayoutMetadata";
  }
  else {
    v131 = @"place_summary_layout_metadata";
  }
  v132 = [v152 objectForKeyedSubscript:v131];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v133 = [GEOPDPlaceSummaryLayoutMetadata alloc];
    if (a3) {
      v134 = [(GEOPDPlaceSummaryLayoutMetadata *)v133 initWithJSON:v132];
    }
    else {
      v134 = [(GEOPDPlaceSummaryLayoutMetadata *)v133 initWithDictionary:v132];
    }
    v135 = v134;
    -[GEOPDAutocompleteResult setPlaceSummaryLayoutMetadata:](v173, v134);
  }
  if (a3) {
    v136 = @"shouldUseDistanceFeatureServerResults";
  }
  else {
    v136 = @"should_use_distance_feature_server_results";
  }
  v137 = [v152 objectForKeyedSubscript:v136];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v138 = [v137 BOOLValue];
    *(_DWORD *)(v173 + 104) |= 0x40000u;
    *(_DWORD *)(v173 + 104) |= 0x400u;
    *(unsigned char *)(v173 + 103) = v138;
  }

  if (a3) {
    v139 = @"clientResolvedTypeSetupPrompt";
  }
  else {
    v139 = @"client_resolved_type_setup_prompt";
  }
  v140 = [v152 objectForKeyedSubscript:v139];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v141 = v140;
    if ([v141 isEqualToString:@"RESOLVED_ITEM_TYPE_UNKNOWN"])
    {
      int v142 = 0;
    }
    else if ([v141 isEqualToString:@"RESOLVED_ITEM_TYPE_HOME"])
    {
      int v142 = 1;
    }
    else if ([v141 isEqualToString:@"RESOLVED_ITEM_TYPE_WORK"])
    {
      int v142 = 2;
    }
    else if ([v141 isEqualToString:@"RESOLVED_ITEM_TYPE_PARKED_CAR"])
    {
      int v142 = 3;
    }
    else if ([v141 isEqualToString:@"RESOLVED_ITEM_TYPE_CURRENT_LOCATION"])
    {
      int v142 = 4;
    }
    else if ([v141 isEqualToString:@"RESOLVED_ITEM_TYPE_SERVER"])
    {
      int v142 = 5;
    }
    else if ([v141 isEqualToString:@"RESOLVED_ITEM_TYPE_SCHOOL"])
    {
      int v142 = 6;
    }
    else
    {
      int v142 = 0;
    }

LABEL_451:
    *(_DWORD *)(v173 + 104) |= 0x40000u;
    *(_DWORD *)(v173 + 104) |= 1u;
    *(_DWORD *)(v173 + 84) = v142;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v142 = [v140 intValue];
      goto LABEL_451;
    }
  }

  if (a3) {
    v143 = @"highlightType";
  }
  else {
    v143 = @"highlight_type";
  }
  v144 = [v152 objectForKeyedSubscript:v143];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v145 = v144;
    if ([v145 isEqualToString:@"AUTOCOMPLETE_RESULT_HIGHLIGHT_TYPE_BOLD_HIGHLIGHT"])
    {
      int v146 = 0;
    }
    else if ([v145 isEqualToString:@"AUTOCOMPLETE_RESULT_HIGHLIGHT_TYPE_GRAYSCALE_DARKER_GRAY"])
    {
      int v146 = 1;
    }
    else if ([v145 isEqualToString:@"AUTOCOMPLETE_RESULT_HIGHLIGHT_TYPE_GRAYSCALE_DARKER_GRAY_INVERSE"])
    {
      int v146 = 2;
    }
    else
    {
      int v146 = 0;
    }

LABEL_466:
    *(_DWORD *)(v173 + 104) |= 0x40000u;
    *(_DWORD *)(v173 + 104) |= 2u;
    *(_DWORD *)(v173 + 88) = v146;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v146 = [v144 intValue];
      goto LABEL_466;
    }
  }

  if (a3) {
    v147 = @"enableStructuredRapAffordance";
  }
  else {
    v147 = @"enable_structured_rap_affordance";
  }
  v148 = [v152 objectForKeyedSubscript:v147];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v149 = [v148 BOOLValue];
    *(_DWORD *)(v173 + 104) |= 0x40000u;
    *(_DWORD *)(v173 + 104) |= 0x10u;
    *(unsigned char *)(v173 + 97) = v149;
  }

  id v4 = v152;
LABEL_473:

  return v173;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDAutocompleteResultReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDAutocompleteResultIsDirty((uint64_t)self) & 1) == 0)
  {
    v20 = self->_reader;
    objc_sync_enter(v20);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v21 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v21];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v20);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDAutocompleteResult readAll:]((uint64_t)self, 0);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v6 = self->_sections;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v31;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v31 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v7);
    }

    $5646BE895E83280503A1F7E74119B9AF flags = self->_flags;
    if ((*(unsigned char *)&flags & 8) != 0)
    {
      PBDataWriterWriteBOOLField();
      $5646BE895E83280503A1F7E74119B9AF flags = self->_flags;
    }
    if ((*(_WORD *)&flags & 0x100) != 0)
    {
      PBDataWriterWriteBOOLField();
      $5646BE895E83280503A1F7E74119B9AF flags = self->_flags;
    }
    if ((*(unsigned char *)&flags & 4) != 0)
    {
      PBDataWriterWriteUint32Field();
      $5646BE895E83280503A1F7E74119B9AF flags = self->_flags;
    }
    if ((*(unsigned char *)&flags & 0x20) != 0) {
      PBDataWriterWriteBOOLField();
    }
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v11 = self->_sortPriorityMappings;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v26 objects:v35 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v27;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v27 != v13) {
            objc_enumerationMutation(v11);
          }
          PBDataWriterWriteSubmessage();
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v26 objects:v35 count:16];
      }
      while (v12);
    }

    if ((*(unsigned char *)&self->_flags & 0x40) != 0) {
      PBDataWriterWriteBOOLField();
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v15 = self->_clientRankingFeatureMetadatas;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v22 objects:v34 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v23;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v23 != v17) {
            objc_enumerationMutation(v15);
          }
          PBDataWriterWriteSubmessage();
          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v22 objects:v34 count:16];
      }
      while (v16);
    }

    if ((*(unsigned char *)&self->_flags & 0x80) != 0) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_autocompleteSessionData) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_parsecQueryRankingFeatures) {
      PBDataWriterWriteSubmessage();
    }
    if ((*((unsigned char *)&self->_flags + 1) & 2) != 0) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_placeSummaryLayoutMetadata) {
      PBDataWriterWriteSubmessage();
    }
    $5646BE895E83280503A1F7E74119B9AF v19 = self->_flags;
    if ((*(_WORD *)&v19 & 0x400) != 0)
    {
      PBDataWriterWriteBOOLField();
      $5646BE895E83280503A1F7E74119B9AF v19 = self->_flags;
    }
    if (*(unsigned char *)&v19)
    {
      PBDataWriterWriteInt32Field();
      $5646BE895E83280503A1F7E74119B9AF v19 = self->_flags;
    }
    if ((*(unsigned char *)&v19 & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      $5646BE895E83280503A1F7E74119B9AF v19 = self->_flags;
    }
    if ((*(unsigned char *)&v19 & 0x10) != 0) {
      PBDataWriterWriteBOOLField();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v22);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDAutocompleteResult readAll:]((uint64_t)self, 0);
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    uint64_t v9 = self->_sections;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v42 objects:v48 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v43 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = (void *)[*(id *)(*((void *)&v42 + 1) + 8 * i) copyWithZone:a3];
          -[GEOPDAutocompleteResult addSections:]((os_unfair_lock_s *)v5, v13);
        }
        uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v42 objects:v48 count:16];
      }
      while (v10);
    }

    $5646BE895E83280503A1F7E74119B9AF flags = self->_flags;
    if ((*(unsigned char *)&flags & 8) != 0)
    {
      *(unsigned char *)(v5 + 96) = self->_enableRap;
      *(_DWORD *)(v5 + 104) |= 8u;
      $5646BE895E83280503A1F7E74119B9AF flags = self->_flags;
      if ((*(_WORD *)&flags & 0x100) == 0)
      {
LABEL_14:
        if ((*(unsigned char *)&flags & 4) == 0) {
          goto LABEL_15;
        }
        goto LABEL_46;
      }
    }
    else if ((*(_WORD *)&flags & 0x100) == 0)
    {
      goto LABEL_14;
    }
    *(unsigned char *)(v5 + 101) = self->_shouldDisplayNoResults;
    *(_DWORD *)(v5 + 104) |= 0x100u;
    $5646BE895E83280503A1F7E74119B9AF flags = self->_flags;
    if ((*(unsigned char *)&flags & 4) == 0)
    {
LABEL_15:
      if ((*(unsigned char *)&flags & 0x20) == 0) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
LABEL_46:
    *(_DWORD *)(v5 + 92) = self->_retainSearchTime;
    *(_DWORD *)(v5 + 104) |= 4u;
    if ((*(_DWORD *)&self->_flags & 0x20) == 0)
    {
LABEL_17:
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      v15 = self->_sortPriorityMappings;
      uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v38 objects:v47 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v39;
        do
        {
          for (uint64_t j = 0; j != v16; ++j)
          {
            if (*(void *)v39 != v17) {
              objc_enumerationMutation(v15);
            }
            $5646BE895E83280503A1F7E74119B9AF v19 = (void *)[*(id *)(*((void *)&v38 + 1) + 8 * j) copyWithZone:a3];
            -[GEOPDAutocompleteResult addSortPriorityMapping:]((os_unfair_lock_s *)v5, v19);
          }
          uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v38 objects:v47 count:16];
        }
        while (v16);
      }

      if ((*(unsigned char *)&self->_flags & 0x40) != 0)
      {
        *(unsigned char *)(v5 + 99) = self->_isTopSectionTypeQuery;
        *(_DWORD *)(v5 + 104) |= 0x40u;
      }
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      v20 = self->_clientRankingFeatureMetadatas;
      uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v34 objects:v46 count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v35;
        do
        {
          for (uint64_t k = 0; k != v21; ++k)
          {
            if (*(void *)v35 != v22) {
              objc_enumerationMutation(v20);
            }
            long long v24 = objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * k), "copyWithZone:", a3, (void)v34);
            -[GEOPDAutocompleteResult addClientRankingFeatureMetadata:]((os_unfair_lock_s *)v5, v24);
          }
          uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v34 objects:v46 count:16];
        }
        while (v21);
      }

      if ((*(unsigned char *)&self->_flags & 0x80) != 0)
      {
        *(unsigned char *)(v5 + 100) = self->_shouldDifferentiateClientAndServerResults;
        *(_DWORD *)(v5 + 104) |= 0x80u;
      }
      id v25 = -[GEOPDAutocompleteSessionData copyWithZone:](self->_autocompleteSessionData, "copyWithZone:", a3, (void)v34);
      long long v26 = *(void **)(v5 + 24);
      *(void *)(v5 + 24) = v25;

      id v27 = [(GEOPDParsecQueryRankingFeatures *)self->_parsecQueryRankingFeatures copyWithZone:a3];
      long long v28 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = v27;

      if ((*((unsigned char *)&self->_flags + 1) & 2) != 0)
      {
        *(unsigned char *)(v5 + 102) = self->_shouldEnableGrayscaleHighlighting;
        *(_DWORD *)(v5 + 104) |= 0x200u;
      }
      id v29 = [(GEOPDPlaceSummaryLayoutMetadata *)self->_placeSummaryLayoutMetadata copyWithZone:a3];
      long long v30 = *(void **)(v5 + 48);
      *(void *)(v5 + 48) = v29;

      $5646BE895E83280503A1F7E74119B9AF v31 = self->_flags;
      if ((*(_WORD *)&v31 & 0x400) != 0)
      {
        *(unsigned char *)(v5 + 103) = self->_shouldUseDistanceFeatureServerResults;
        *(_DWORD *)(v5 + 104) |= 0x400u;
        $5646BE895E83280503A1F7E74119B9AF v31 = self->_flags;
        if ((*(unsigned char *)&v31 & 1) == 0)
        {
LABEL_39:
          if ((*(unsigned char *)&v31 & 2) == 0) {
            goto LABEL_40;
          }
          goto LABEL_50;
        }
      }
      else if ((*(unsigned char *)&v31 & 1) == 0)
      {
        goto LABEL_39;
      }
      *(_DWORD *)(v5 + 84) = self->_clientResolvedTypeSetupPrompt;
      *(_DWORD *)(v5 + 104) |= 1u;
      $5646BE895E83280503A1F7E74119B9AF v31 = self->_flags;
      if ((*(unsigned char *)&v31 & 2) == 0)
      {
LABEL_40:
        if ((*(unsigned char *)&v31 & 0x10) == 0)
        {
LABEL_42:
          long long v32 = self->_unknownFields;
          id v8 = *(id *)(v5 + 16);
          *(void *)(v5 + 16) = v32;
          goto LABEL_43;
        }
LABEL_41:
        *(unsigned char *)(v5 + 97) = self->_enableStructuredRapAffordance;
        *(_DWORD *)(v5 + 104) |= 0x10u;
        goto LABEL_42;
      }
LABEL_50:
      *(_DWORD *)(v5 + 88) = self->_highlightType;
      *(_DWORD *)(v5 + 104) |= 2u;
      if ((*(_DWORD *)&self->_flags & 0x10) == 0) {
        goto LABEL_42;
      }
      goto LABEL_41;
    }
LABEL_16:
    *(unsigned char *)(v5 + 98) = self->_isNoResultFromNegativeCache;
    *(_DWORD *)(v5 + 104) |= 0x20u;
    goto LABEL_17;
  }
  uint64_t v7 = reader;
  objc_sync_enter(v7);
  if ((*((unsigned char *)&self->_flags + 2) & 4) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPDAutocompleteResultReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  id v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_43:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_91;
  }
  -[GEOPDAutocompleteResult readAll:]((uint64_t)self, 1);
  -[GEOPDAutocompleteResult readAll:]((uint64_t)v4, 1);
  sections = self->_sections;
  if ((unint64_t)sections | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](sections, "isEqual:")) {
      goto LABEL_91;
    }
  }
  $5646BE895E83280503A1F7E74119B9AF flags = self->_flags;
  int v7 = *((_DWORD *)v4 + 26);
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    if ((v7 & 8) == 0) {
      goto LABEL_91;
    }
    if (self->_enableRap)
    {
      if (!*((unsigned char *)v4 + 96)) {
        goto LABEL_91;
      }
    }
    else if (*((unsigned char *)v4 + 96))
    {
      goto LABEL_91;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_91;
  }
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
    if ((v7 & 0x100) == 0) {
      goto LABEL_91;
    }
    if (self->_shouldDisplayNoResults)
    {
      if (!*((unsigned char *)v4 + 101)) {
        goto LABEL_91;
      }
    }
    else if (*((unsigned char *)v4 + 101))
    {
      goto LABEL_91;
    }
  }
  else if ((v7 & 0x100) != 0)
  {
    goto LABEL_91;
  }
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_retainSearchTime != *((_DWORD *)v4 + 23)) {
      goto LABEL_91;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_91;
  }
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0) {
      goto LABEL_91;
    }
    if (self->_isNoResultFromNegativeCache)
    {
      if (!*((unsigned char *)v4 + 98)) {
        goto LABEL_91;
      }
    }
    else if (*((unsigned char *)v4 + 98))
    {
      goto LABEL_91;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_91;
  }
  sortPriorityMappings = self->_sortPriorityMappings;
  if ((unint64_t)sortPriorityMappings | *((void *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](sortPriorityMappings, "isEqual:")) {
      goto LABEL_91;
    }
    $5646BE895E83280503A1F7E74119B9AF flags = self->_flags;
    int v7 = *((_DWORD *)v4 + 26);
  }
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0) {
      goto LABEL_91;
    }
    if (self->_isTopSectionTypeQuery)
    {
      if (!*((unsigned char *)v4 + 99)) {
        goto LABEL_91;
      }
    }
    else if (*((unsigned char *)v4 + 99))
    {
      goto LABEL_91;
    }
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_91;
  }
  clientRankingFeatureMetadatas = self->_clientRankingFeatureMetadatas;
  if ((unint64_t)clientRankingFeatureMetadatas | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](clientRankingFeatureMetadatas, "isEqual:")) {
      goto LABEL_91;
    }
    $5646BE895E83280503A1F7E74119B9AF flags = self->_flags;
    int v7 = *((_DWORD *)v4 + 26);
  }
  if ((*(unsigned char *)&flags & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0) {
      goto LABEL_91;
    }
    if (self->_shouldDifferentiateClientAndServerResults)
    {
      if (!*((unsigned char *)v4 + 100)) {
        goto LABEL_91;
      }
    }
    else if (*((unsigned char *)v4 + 100))
    {
      goto LABEL_91;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_91;
  }
  autocompleteSessionData = self->_autocompleteSessionData;
  if ((unint64_t)autocompleteSessionData | *((void *)v4 + 3)
    && !-[GEOPDAutocompleteSessionData isEqual:](autocompleteSessionData, "isEqual:"))
  {
    goto LABEL_91;
  }
  parsecQueryRankingFeatures = self->_parsecQueryRankingFeatures;
  if ((unint64_t)parsecQueryRankingFeatures | *((void *)v4 + 5))
  {
    if (!-[GEOPDParsecQueryRankingFeatures isEqual:](parsecQueryRankingFeatures, "isEqual:")) {
      goto LABEL_91;
    }
  }
  $5646BE895E83280503A1F7E74119B9AF v12 = self->_flags;
  int v13 = *((_DWORD *)v4 + 26);
  if ((*(_WORD *)&v12 & 0x200) != 0)
  {
    if ((v13 & 0x200) == 0) {
      goto LABEL_91;
    }
    if (self->_shouldEnableGrayscaleHighlighting)
    {
      if (!*((unsigned char *)v4 + 102)) {
        goto LABEL_91;
      }
    }
    else if (*((unsigned char *)v4 + 102))
    {
      goto LABEL_91;
    }
  }
  else if ((v13 & 0x200) != 0)
  {
    goto LABEL_91;
  }
  placeSummaryLayoutMetadata = self->_placeSummaryLayoutMetadata;
  if ((unint64_t)placeSummaryLayoutMetadata | *((void *)v4 + 6))
  {
    if (!-[GEOPDPlaceSummaryLayoutMetadata isEqual:](placeSummaryLayoutMetadata, "isEqual:")) {
      goto LABEL_91;
    }
    $5646BE895E83280503A1F7E74119B9AF v12 = self->_flags;
    int v13 = *((_DWORD *)v4 + 26);
  }
  if ((*(_WORD *)&v12 & 0x400) != 0)
  {
    if ((v13 & 0x400) == 0) {
      goto LABEL_91;
    }
    if (self->_shouldUseDistanceFeatureServerResults)
    {
      if (!*((unsigned char *)v4 + 103)) {
        goto LABEL_91;
      }
    }
    else if (*((unsigned char *)v4 + 103))
    {
      goto LABEL_91;
    }
  }
  else if ((v13 & 0x400) != 0)
  {
    goto LABEL_91;
  }
  if (*(unsigned char *)&v12)
  {
    if ((v13 & 1) == 0 || self->_clientResolvedTypeSetupPrompt != *((_DWORD *)v4 + 21)) {
      goto LABEL_91;
    }
  }
  else if (v13)
  {
    goto LABEL_91;
  }
  if ((*(unsigned char *)&v12 & 2) != 0)
  {
    if ((v13 & 2) == 0 || self->_highlightType != *((_DWORD *)v4 + 22)) {
      goto LABEL_91;
    }
  }
  else if ((v13 & 2) != 0)
  {
    goto LABEL_91;
  }
  if ((*(unsigned char *)&v12 & 0x10) != 0)
  {
    if ((v13 & 0x10) != 0)
    {
      if (self->_enableStructuredRapAffordance)
      {
        if (!*((unsigned char *)v4 + 97)) {
          goto LABEL_91;
        }
      }
      else if (*((unsigned char *)v4 + 97))
      {
        goto LABEL_91;
      }
      BOOL v15 = 1;
      goto LABEL_92;
    }
LABEL_91:
    BOOL v15 = 0;
    goto LABEL_92;
  }
  BOOL v15 = (v13 & 0x10) == 0;
LABEL_92:

  return v15;
}

- (unint64_t)hash
{
  -[GEOPDAutocompleteResult readAll:]((uint64_t)self, 1);
  uint64_t v22 = [(NSMutableArray *)self->_sections hash];
  $5646BE895E83280503A1F7E74119B9AF flags = self->_flags;
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    uint64_t v21 = 2654435761 * self->_enableRap;
    if ((*(_WORD *)&flags & 0x100) != 0)
    {
LABEL_3:
      uint64_t v20 = 2654435761 * self->_shouldDisplayNoResults;
      if ((*(unsigned char *)&flags & 4) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v19 = 0;
      if ((*(unsigned char *)&flags & 0x20) != 0) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v21 = 0;
    if ((*(_WORD *)&flags & 0x100) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v20 = 0;
  if ((*(unsigned char *)&flags & 4) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v19 = 2654435761 * self->_retainSearchTime;
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
LABEL_5:
    uint64_t v18 = 2654435761 * self->_isNoResultFromNegativeCache;
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v18 = 0;
LABEL_10:
  uint64_t v4 = [(NSMutableArray *)self->_sortPriorityMappings hash];
  if ((*(unsigned char *)&self->_flags & 0x40) != 0) {
    uint64_t v5 = 2654435761 * self->_isTopSectionTypeQuery;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = [(NSMutableArray *)self->_clientRankingFeatureMetadatas hash];
  if ((*(unsigned char *)&self->_flags & 0x80) != 0) {
    uint64_t v7 = 2654435761 * self->_shouldDifferentiateClientAndServerResults;
  }
  else {
    uint64_t v7 = 0;
  }
  unint64_t v8 = [(GEOPDAutocompleteSessionData *)self->_autocompleteSessionData hash];
  unint64_t v9 = [(GEOPDParsecQueryRankingFeatures *)self->_parsecQueryRankingFeatures hash];
  if ((*((unsigned char *)&self->_flags + 1) & 2) != 0) {
    uint64_t v10 = 2654435761 * self->_shouldEnableGrayscaleHighlighting;
  }
  else {
    uint64_t v10 = 0;
  }
  unint64_t v11 = [(GEOPDPlaceSummaryLayoutMetadata *)self->_placeSummaryLayoutMetadata hash];
  $5646BE895E83280503A1F7E74119B9AF v12 = self->_flags;
  if ((*(_WORD *)&v12 & 0x400) != 0)
  {
    uint64_t v13 = 2654435761 * self->_shouldUseDistanceFeatureServerResults;
    if (*(unsigned char *)&v12)
    {
LABEL_21:
      uint64_t v14 = 2654435761 * self->_clientResolvedTypeSetupPrompt;
      if ((*(unsigned char *)&v12 & 2) != 0) {
        goto LABEL_22;
      }
LABEL_26:
      uint64_t v15 = 0;
      if ((*(unsigned char *)&v12 & 0x10) != 0) {
        goto LABEL_23;
      }
LABEL_27:
      uint64_t v16 = 0;
      return v21 ^ v22 ^ v20 ^ v19 ^ v18 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16;
    }
  }
  else
  {
    uint64_t v13 = 0;
    if (*(unsigned char *)&v12) {
      goto LABEL_21;
    }
  }
  uint64_t v14 = 0;
  if ((*(unsigned char *)&v12 & 2) == 0) {
    goto LABEL_26;
  }
LABEL_22:
  uint64_t v15 = 2654435761 * self->_highlightType;
  if ((*(unsigned char *)&v12 & 0x10) == 0) {
    goto LABEL_27;
  }
LABEL_23:
  uint64_t v16 = 2654435761 * self->_enableStructuredRapAffordance;
  return v21 ^ v22 ^ v20 ^ v19 ^ v18 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortPriorityMappings, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_placeSummaryLayoutMetadata, 0);
  objc_storeStrong((id *)&self->_parsecQueryRankingFeatures, 0);
  objc_storeStrong((id *)&self->_clientRankingFeatureMetadatas, 0);
  objc_storeStrong((id *)&self->_autocompleteSessionData, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end